//
//  BuddhaApp.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI
import SwiftData

@main
struct BuddhaApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            BuddhistText.self,
            Chapter.self,
            Verse.self,
            Note.self,
            Highlight.self,
            Bookmark.self,
            ReadingHistory.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(sharedModelContainer)
    }
}
