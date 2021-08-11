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
        var content: CardContent
        var id: Int
    }
    
    var score = 0
    
    private(set) var cards : Array<Card>
    
    var oneAndOnlyOneOpenCard : Int?
    
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
                oneAndOnlyOneOpenCard = nil
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                    cards[index].isFaceUp = false
                    cards[index].hasAlreadyBeenSeen = true
                    }
                }
                oneAndOnlyOneOpenCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
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
