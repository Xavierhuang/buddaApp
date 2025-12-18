//
//  ReadingHistory.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import Foundation
import SwiftData

@Model
final class ReadingHistory {
    var id: UUID
    var textTitle: String
    var chapterNumber: Int
    var verseNumber: Int?
    var lastReadAt: Date
    
    init(textTitle: String, chapterNumber: Int, verseNumber: Int? = nil) {
        self.id = UUID()
        self.textTitle = textTitle
        self.chapterNumber = chapterNumber
        self.verseNumber = verseNumber
        self.lastReadAt = Date()
    }
}

