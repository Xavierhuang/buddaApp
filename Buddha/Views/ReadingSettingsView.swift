//
//  ReadingSettingsView.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI

struct ReadingSettingsView: View {
    @AppStorage("fontSize") private var fontSize: Double = 16
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Text Size") {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("A")
                                .font(.system(size: 12))
                            Slider(value: $fontSize, in: 12...24, step: 1)
                            Text("A")
                                .font(.system(size: 24))
                        }
                        Text("Current size: \(Int(fontSize))pt")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
            }
            .navigationTitle("Reading Settings")
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
}

