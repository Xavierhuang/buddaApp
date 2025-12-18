//
//  Note.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import Foundation
import SwiftData

@Model
final class Note {
    var id: UUID
    var text: String
    var content: String
    var textTitle: String
    var chapterNumber: Int
    var verseNumber: Int?
    var createdAt: Date
    var updatedAt: Date
    
    init(text: String, content: String, textTitle: String, chapterNumber: Int, verseNumber: Int? = nil) {
        self.id = UUID()
        self.text = text
        self.content = content
        self.textTitle = textTitle
        self.chapterNumber = chapterNumber
        self.verseNumber = verseNumber
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}

