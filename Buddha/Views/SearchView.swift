//
//  SearchView.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Query private var texts: [BuddhistText]
    @State private var searchText = ""
    @State private var searchResults: [SearchResult] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if searchText.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        Text("Search Buddhist Texts")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Enter a word or phrase to search across all texts")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                } else if searchResults.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "text.magnifyingglass")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        Text("No results found")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Try different keywords")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                } else {
                    List {
                        ForEach(searchResults, id: \.id) { result in
                            NavigationLink(destination: ReadingView(textTitle: result.textTitle, chapterNumber: result.chapterNumber)) {
                                SearchResultRow(result: result)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search verses...")
            .onChange(of: searchText) { oldValue, newValue in
                performSearch(query: newValue)
            }
        }
    }
    
    private func performSearch(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            return
        }
        
        var results: [SearchResult] = []
        let lowerQuery = query.lowercased()
        
        for text in texts {
            for chapter in text.chapters {
                for verse in chapter.verses {
                    let searchableText = [
                        verse.text,
                        verse.pinyin,
                        verse.chinese,
                        verse.notation
                    ].compactMap { $0 }.joined(separator: " ").lowercased()
                    
                    if searchableText.contains(lowerQuery) {
                        results.append(SearchResult(
                            id: UUID(),
                            textTitle: text.title,
                            chapterNumber: chapter.number,
                            verseNumber: verse.number,
                            verseText: verse.text,
                            matchedText: query
                        ))
                    }
                }
            }
        }
        
        searchResults = results
    }
}

struct SearchResult: Identifiable {
    let id: UUID
    let textTitle: String
    let chapterNumber: Int
    let verseNumber: Int
    let verseText: String
    let matchedText: String
}

struct SearchResultRow: View {
    let result: SearchResult
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(result.textTitle)
                    .font(.headline)
                Spacer()
                Text("Ch. \(result.chapterNumber), V. \(result.verseNumber)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(result.verseText)
                .font(.body)
                .lineLimit(3)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
    }
}

