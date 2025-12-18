//
//  HomeView.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var texts: [BuddhistText]
    @Query private var bookmarks: [Bookmark]
    @Query private var notes: [Note]
    @Query private var highlights: [Highlight]
    @Query private var readingHistory: [ReadingHistory]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Daily Verse Section
                    DailyVerseCard()
                    
                    // Quick Stats
                    HStack(spacing: 15) {
                        StatCard(title: "Texts", count: texts.count, icon: "book.fill", color: .blue)
                        StatCard(title: "Notes", count: notes.count, icon: "note.text", color: .green)
                        StatCard(title: "Bookmarks", count: bookmarks.count, icon: "bookmark.fill", color: .orange)
                        StatCard(title: "Highlights", count: highlights.count, icon: "highlighter", color: .purple)
                    }
                    .padding(.horizontal)
                    
                    // Recent Reading
                    if let recent = readingHistory.sorted(by: { $0.lastReadAt > $1.lastReadAt }).first {
                        RecentReadingCard(history: recent)
                    }
                    
                    // Bookmarks Section
                    if !bookmarks.isEmpty {
                        BookmarksSection(bookmarks: Array(bookmarks.prefix(5)))
                    }
                    
                    // Continue Reading
                    if !texts.isEmpty {
                        ContinueReadingSection(texts: texts)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Buddha")
        }
    }
}

struct DailyVerseCard: View {
    @Query private var texts: [BuddhistText]
    
    var dailyVerse: (text: String, source: String)? {
        guard !texts.isEmpty else { return nil }
        let allVerses = texts.flatMap { text in
            text.chapters.flatMap { chapter in
                chapter.verses.map { verse in
                    (verse.text, "\(text.title) - Chapter \(chapter.number)")
                }
            }
        }
        
        guard !allVerses.isEmpty else { return nil }
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
        let index = (dayOfYear - 1) % allVerses.count
        return allVerses[index]
    }
    
    var body: some View {
        if let verse = dailyVerse {
            VStack(alignment: .leading, spacing: 12) {
                Text("Daily Verse")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(verse.text)
                    .font(.body)
                    .lineSpacing(6)
                
                Text(verse.source)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

struct StatCard: View {
    let title: String
    let count: Int
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            Text("\(count)")
                .font(.title3)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct RecentReadingCard: View {
    let history: ReadingHistory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Recent Reading")
                .font(.headline)
                .foregroundColor(.secondary)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(history.textTitle)
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("Chapter \(history.chapterNumber)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                NavigationLink(destination: ReadingView(textTitle: history.textTitle, chapterNumber: history.chapterNumber)) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct ContinueReadingSection: View {
    let texts: [BuddhistText]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Continue Reading")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(texts.prefix(5), id: \.id) { text in
                        NavigationLink(destination: ReadingView(textTitle: text.title, chapterNumber: 1)) {
                            TextCard(text: text)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TextCard: View {
    let text: BuddhistText
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "book.closed.fill")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(height: 60)
            
            Text(text.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            if let author = text.author {
                Text(author)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 120, height: 140)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct BookmarksSection: View {
    let bookmarks: [Bookmark]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Recent Bookmarks")
                    .font(.headline)
                Spacer()
                NavigationLink(destination: BookmarksView()) {
                    Text("See All")
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(bookmarks, id: \.id) { bookmark in
                        NavigationLink(destination: ReadingView(textTitle: bookmark.textTitle, chapterNumber: bookmark.chapterNumber)) {
                            BookmarkCard(bookmark: bookmark)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct BookmarkCard: View {
    let bookmark: Bookmark
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "bookmark.fill")
                .font(.title)
                .foregroundColor(.orange)
            
            Text(bookmark.textTitle)
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Text("Chapter \(bookmark.chapterNumber)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 120, height: 100)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

