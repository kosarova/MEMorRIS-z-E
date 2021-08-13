//
//  memorazeGameModel.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 25.07.2021.
//
import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    struct Card : Identifiable {
        var isMatching = false
        var isFaceUp = false
        var hasAlreadyBeenSeen = false
        let content: CardContent
        let id: Int
    }
    
    private(set) var score = 0
    
    private(set) var cards : Array<Card>
    
    private var oneAndOnlyOneOpenCard : Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) }}
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
                             !cards[chosenIndex].isMatching,
                             !cards[chosenIndex].isFaceUp {
            if  let potentialIndexValue = oneAndOnlyOneOpenCard {
                if cards[chosenIndex].content == cards[potentialIndexValue].content {
                    cards[chosenIndex].isMatching = true
                    cards[potentialIndexValue].isMatching = true
                    score += 2
                } else {
                    if cards[chosenIndex].hasAlreadyBeenSeen || cards[potentialIndexValue].hasAlreadyBeenSeen {
                        score -= 1
                    }
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].hasAlreadyBeenSeen = true
                    }
                }
                oneAndOnlyOneOpenCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
}
extension Array {
    var oneAndOnly : Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
