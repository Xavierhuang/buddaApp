//
//  HighlightColorPickerView.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI
import SwiftData

struct HighlightColorPickerView: View {
    let textTitle: String
    let chapterNumber: Int
    let verseNumber: Int?
    let verseText: String
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var existingHighlights: [Highlight]
    
    let colors: [(name: String, color: Color)] = [
        ("yellow", .yellow),
        ("green", .green),
        ("blue", .blue),
        ("pink", .pink),
        ("purple", .purple)
    ]
    
    var existingHighlight: Highlight? {
        existingHighlights.first { $0.textTitle == textTitle && 
                                   $0.chapterNumber == chapterNumber && 
                                   $0.verseNumber == verseNumber }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                // Verse reference
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(textTitle) - Chapter \(chapterNumber)")
                        .font(.headline)
                    if let verseNumber = verseNumber {
                        Text("Verse \(verseNumber)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Text(verseText)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding()
                
                // Color picker
                VStack(alignment: .leading, spacing: 16) {
                    Text("Choose highlight color:")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        ForEach(colors, id: \.name) { colorOption in
                            Button(action: {
                                highlightWithColor(colorOption.name)
                            }) {
                                Circle()
                                    .fill(colorOption.color)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Circle()
                                            .stroke(existingHighlight?.color == colorOption.name ? Color.primary : Color.clear, lineWidth: 3)
                                    )
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                // Remove highlight button
                if existingHighlight != nil {
                    Button(action: removeHighlight) {
                        Text("Remove Highlight")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("Highlight")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func highlightWithColor(_ colorName: String) {
        // Remove existing highlight if any
        if let existing = existingHighlight {
            modelContext.delete(existing)
        }
        
        // Add new highlight
        let highlight = Highlight(
            text: verseText,
            textTitle: textTitle,
            chapterNumber: chapterNumber,
            verseNumber: verseNumber,
            color: colorName
        )
        modelContext.insert(highlight)
        try? modelContext.save()
    }
    
    private func removeHighlight() {
        if let existing = existingHighlight {
            modelContext.delete(existing)
            try? modelContext.save()
        }
        dismiss()
    }
}

