//
//  memorazeGameModel.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 25.07.2021.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card {
        var isMatching = false
        var isFaceUp = false
        
        var content: CardContent
    }
    
    private(set) var cards : Array<Card>
    
    func choose(_ cards: Card){
        
    }
    
    init(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
}
