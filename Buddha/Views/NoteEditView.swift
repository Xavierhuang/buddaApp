//
//  NoteEditView.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI
import SwiftData

struct NoteEditView: View {
    let textTitle: String
    let chapterNumber: Int
    let verseNumber: Int?
    let verseText: String
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var noteContent: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
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
                
                // Note editor
                TextEditor(text: $noteContent)
                    .focused($isFocused)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .navigationTitle("Add Note")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveNote()
                    }
                    .disabled(noteContent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .onAppear {
                isFocused = true
            }
        }
    }
    
    private func saveNote() {
        let note = Note(
            text: verseText,
            content: noteContent,
            textTitle: textTitle,
            chapterNumber: chapterNumber,
            verseNumber: verseNumber
        )
        modelContext.insert(note)
        try? modelContext.save()
        dismiss()
    }
}

