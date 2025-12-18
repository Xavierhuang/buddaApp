//
//  Highlight.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import Foundation
import SwiftData

@Model
final class Highlight {
    var id: UUID
    var text: String
    var textTitle: String
    var chapterNumber: Int
    var verseNumber: Int?
    var color: String // "yellow", "green", "blue", "pink", "purple"
    var createdAt: Date
    
    init(text: String, textTitle: String, chapterNumber: Int, verseNumber: Int? = nil, color: String = "yellow") {
        self.id = UUID()
        self.text = text
        self.textTitle = textTitle
        self.chapterNumber = chapterNumber
        self.verseNumber = verseNumber
        self.color = color
        self.createdAt = Date()
    }
}

