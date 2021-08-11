//
//  Theme.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 10.08.2021.
//

import Foundation

struct Theme {
    var nameOfTheme: String
    var emojis: Array<String>
    var numberOfThePairsOfCards: Int
    var colorToDrawCardView: String
    
    init(nameOfTheme: String, emojis: Array<String>, numberOfThePairsOfCards: Int, colorToDrawCardView: String) {
        self.nameOfTheme = nameOfTheme
        self.emojis = emojis
        self.numberOfThePairsOfCards = numberOfThePairsOfCards > emojis.count ? emojis.count : numberOfThePairsOfCards
        self.colorToDrawCardView = colorToDrawCardView
    }
}
