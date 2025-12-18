//
//  LibraryView.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI
import SwiftData

struct LibraryView: View {
    @Query(sort: \BuddhistText.title) private var texts: [BuddhistText]
    @State private var searchText = ""
    @State private var selectedCategory: String? = nil
    
    var categories: [String] {
        Array(Set(texts.map { $0.category })).sorted()
    }
    
    var filteredTexts: [BuddhistText] {
        var result = texts
        
        if !searchText.isEmpty {
            result = result.filter { $0.title.localizedCaseInsensitiveContains(searchText) || 
                                    ($0.author?.localizedCaseInsensitiveContains(searchText) ?? false) }
        }
        
        if let category = selectedCategory {
            result = result.filter { $0.category == category }
        }
        
        return result
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Category Filter
                if !categories.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            CategoryButton(title: "All", isSelected: selectedCategory == nil) {
                                selectedCategory = nil
                            }
                            
                            ForEach(categories, id: \.self) { category in
                                CategoryButton(title: category, isSelected: selectedCategory == category) {
                                    selectedCategory = category
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 10)
                    .background(Color(.systemBackground))
                }
                
                // Text List
                List {
                    ForEach(filteredTexts, id: \.id) { text in
                        NavigationLink(destination: TextDetailView(text: text)) {
                            LibraryRow(text: text)
                        }
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: "Search texts...")
            }
            .navigationTitle("Library")
        }
    }
}

struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? .white : .primary)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue : Color(.systemGray5))
                .cornerRadius(20)
        }
    }
}

struct LibraryRow: View {
    let text: BuddhistText
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "book.closed.fill")
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(text.title)
                    .font(.headline)
                
                if let author = text.author {
                    Text(author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                if let textDescription = text.textDescription {
                    Text(textDescription)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                
                Text(text.category)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
            
            Text("\(text.chapters.count) chapters")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

struct TextDetailView: View {
    let text: BuddhistText
    @State private var selectedChapter: Chapter?
    
    var body: some View {
        List {
            Section {
                if let textDescription = text.textDescription {
                    Text(textDescription)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                if let author = text.author {
                    HStack {
                        Text("Author:")
                            .fontWeight(.semibold)
                        Text(author)
                    }
                    .font(.subheadline)
                }
            } header: {
                Text("About")
            }
            
            Section {
                ForEach(text.chapters, id: \.id) { chapter in
                    NavigationLink(destination: ReadingView(textTitle: text.title, chapterNumber: chapter.number)) {
                        HStack {
                            Text("Chapter \(chapter.number)")
                                .fontWeight(.medium)
                            if !chapter.title.isEmpty {
                                Text(": \(chapter.title)")
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text("\(chapter.verses.count) verses")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            } header: {
                Text("Chapters")
            }
        }
        .navigationTitle(text.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

