//
//  Bookmark.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import Foundation
import SwiftData

@Model
final class Bookmark {
    var id: UUID
    var text: String
    var textTitle: String
    var chapterNumber: Int
    var verseNumber: Int?
    var createdAt: Date
    
    init(text: String, textTitle: String, chapterNumber: Int, verseNumber: Int? = nil) {
        self.id = UUID()
        self.text = text
        self.textTitle = textTitle
        self.chapterNumber = chapterNumber
        self.verseNumber = verseNumber
        self.createdAt = Date()
    }
}

