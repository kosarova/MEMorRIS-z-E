//
//  EmojiMemoryGameView.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 06.07.2021.
//
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameVM : EmojiMemoryGame
    
    let gameNameTitle = Color("gameNameTitle")
    
    var body: some View {
        VStack{
            Spacer()
            Text("MEMorRiZe!").font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(gameNameTitle)
            ScrollView{
                HStack {
                    Spacer()
                        .overlay(Text("Score: \(gameVM.score)"), alignment: .leading)
                    Text(gameVM.themeName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                LazyVGrid (columns:
                    [GridItem(.adaptive(minimum: 70))]){
                    ForEach (gameVM.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                gameVM.choose(card)
                            }
                    }
                }
            }
            .padding(.horizontal).foregroundColor(gameVM.colorTheme)
            HStack {
                randomTheme
            }
        }
        .foregroundColor(.blue)
    }
    var randomTheme : some View {
        VStack {
            Button {
                gameVM.newGame()
            } label: {
                Image(systemName: "gamecontroller.fill")
                    .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing], 10.0/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 45))
              }
            Text("New Game").font(.system(size: 15))
        }
        .foregroundColor(gameNameTitle)
    }
}
    
struct CardView: View {
    var card : EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geomentry in
            let shape = RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius)
            ZStack {
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstant.lineWidth)
                    Text(card.content).font(fontImage(in: geomentry.size))
                } else if card.isMatching {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    func fontImage(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstant.fontScale)
    }
    struct DrawingConstant {
        static let fontScale : CGFloat = 0.8
        static let lineWidth : CGFloat = 3
        static let cornerRadius : CGFloat = 20
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(gameVM: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(gameVM: game)
            .preferredColorScheme(.light)
    }
}
 
