//
//  ContentView.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 06.07.2021.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
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
                        .overlay(Text("Score: \(viewModel.score)"), alignment: .leading)
                    Text(viewModel.themeName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                LazyVGrid (columns:
                    [GridItem(.adaptive(minimum: 70))]){
                    ForEach (viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding(.horizontal).foregroundColor(viewModel.colorTheme)
            HStack {
                randomTheme
            }
        }
        .foregroundColor(.blue)
    }
    var randomTheme : some View {
        VStack {
            Button {
                viewModel.newGame()
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
    var card : MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.system(size: 50))
            } else if card.isMatching {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
