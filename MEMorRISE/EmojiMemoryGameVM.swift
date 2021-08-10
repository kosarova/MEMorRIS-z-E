//
//  EmojiMemoryGameVM.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 25.07.2021.
//
import SwiftUI

class EmojiMemoryGame : ObservableObject {
    static var emojis = ["🚗", "🚕", "🚙", "🚌", "🏎", "🚑", "🚒", "🚚", "🚜", "🚀", "🚝", "✈️", "🛥", "🚃", "🚓", "🚲", "🦽", "🚂", "🛳", "🚁"]
    
    static func createMemorizeGame () -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards:4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemorizeGame()
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
   
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
