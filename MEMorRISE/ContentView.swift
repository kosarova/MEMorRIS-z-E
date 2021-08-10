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
            .padding(.horizontal).foregroundColor(.red)
            HStack {
                Spacer()
                switchToVehiches.font(.largeTitle)
                Spacer()
                switchToAnimal.font(.largeTitle)
                Spacer()
                switchToFlags.font(.largeTitle)
                Spacer()
            }
            
        }
        .foregroundColor(.blue)
    }
    var switchToVehiches: some View {
        VStack {
            Button {
                EmojiMemoryGame.emojis = ["🚗", "🚕", "🚙", "🚌", "🏎", "🚑", "🚒", "🚚", "🚜", "🚀", "🚝", "✈️", "🛥", "🚃", "🚓", "🚲", "🦽", "🚂", "🛳", "🚁"].shuffled()
            } label: {
                Image(systemName: "car.circle").font(.system(size: 60))
            }
            Text("Transport").font(.system(size: 15))
        }
    }
    var switchToAnimal: some View {
        VStack {
            Button {
                EmojiMemoryGame.emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐴", "🐍"].shuffled()
            } label: {
                Image(systemName: "ant.circle").font(.system(size: 60))
            }
            Text("Animal").font(.system(size: 15))
            }
    }
    var switchToFlags: some View {
        VStack {
            Button {
                EmojiMemoryGame.emojis = ["🇦🇺", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇩🇪", "🇮🇹", "🇪🇸", "🇮🇪", "🇨🇦", "🇷🇺", "🇺🇸", "🇺🇦", "🇯🇵", "🇫🇷", "🇨🇳", "🇰🇿", "🇧🇪"].shuffled()
            } label: {
                Image(systemName: "flag.circle").font(.system(size: 60))
            }
            Text("Flags").font(.system(size: 15))
        }
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
                Text(card.content).font(.largeTitle)
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
