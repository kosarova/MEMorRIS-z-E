//
//  EmojiMemoryGameVM.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 25.07.2021.
//
import SwiftUI

class EmojiMemoryGame : ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemorizeGame(theme: theme)
    }
    
    var score: String {
        return String(model.score)
    }
    
    private static var themes: Array<Theme> = [
        Theme(nameOfTheme: "Vehiches",
              emojis: ["🚗", "🚕", "🚙", "🚌", "🏎", "🚑", "🚒", "🚚", "🚜", "🚀", "🚝", "✈️", "🛥", "🚃", "🚓", "🚲", "🦽", "🚂", "🛳", "🚁"],
              numberOfThePairsOfCards: 6,
              colorToDrawCardView: "blue"
        ),
        Theme(nameOfTheme: "Animal",
              emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐴", "🐍"],
              numberOfThePairsOfCards: 8,
              colorToDrawCardView: "red"
        ),
        Theme(nameOfTheme: "Flags",
              emojis: ["🇦🇺", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇩🇪", "🇮🇹", "🇪🇸", "🇮🇪", "🇨🇦", "🇷🇺", "🇺🇸", "🇺🇦", "🇯🇵", "🇫🇷", "🇨🇳", "🇰🇿", "🇧🇪"],
              numberOfThePairsOfCards: 7,
              colorToDrawCardView: "orange"
        ),
        Theme(nameOfTheme: "Plants",
              emojis: ["🍏","🍐","🍋","🍌","🍉","🍑","🍒","🫐","🥝","🍅","🌶","🍇","🍍","🍊","🍆","🥑"],
              numberOfThePairsOfCards: 8,
              colorToDrawCardView: "green"
        ),
        Theme(nameOfTheme: "Food",
              emojis: ["🍕","🍟","🍔","🌭","🥪","🍗","🌮","🥘","🥗","🥞","🥓","🥙","🍝","🍤","🍩","🍫","🍰","🍭"],
              numberOfThePairsOfCards: 7,
              colorToDrawCardView: "purple"
        ),
        Theme(nameOfTheme: "Landscapes",
              emojis: ["🎆","🌆","🏙","🌌","🌃","🌉","🌁","🎇","🌠","🌄","🌅","🏞","🎑","🗾","🛣","🛤"],
              numberOfThePairsOfCards: 4,
              colorToDrawCardView: "yellow"
        ),
    ]
    
    private static func createMemorizeGame (theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfThePairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    private var theme : Theme
    
    @Published private var model: MemoryGame<String> 
    
    var cards : Array<Card> {
        return model.cards
    }
   
    var themeName : String {
        return theme.nameOfTheme
    }
    var colorTheme: Color {
        switch theme.colorToDrawCardView {
        case "blue":
            return .blue
        case "red":
            return .red
        case "orange":
            return .orange
        case "green":
            return .green
        case "purple":
            return .purple
        case "yellow":
            return .yellow
        default:
            return .pink
        }
    }
   
    //MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemorizeGame(theme: theme)
    }
}

