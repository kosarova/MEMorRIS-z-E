//
//  ContentView.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 06.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗", "🚕", "🚙", "🚌", "🏎", "🚑", "🚒", "🚚", "🚜", "🚀", "🚝", "✈️", "🛥", "🚃", "🚓", "🚲", "🦽", "🚂", "🛳", "🚁"].shuffled()
    @State var amountOfCards = Int.random(in: 4...20)
    let gameNameTitle = Color("gameNameTitle")
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("MEMorRiZe!").font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(gameNameTitle)
            ScrollView{
                LazyVGrid (columns:
                    [GridItem(.adaptive(minimum: 65))]){
                    ForEach (emojis[0..<amountOfCards],
                             id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
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
                emojis = ["🚗", "🚕", "🚙", "🚌", "🏎", "🚑", "🚒", "🚚", "🚜", "🚀", "🚝", "✈️", "🛥", "🚃", "🚓", "🚲", "🦽", "🚂", "🛳", "🚁"].shuffled()
                amountOfCards = Int.random(in: 4...emojis.count)
            } label: {
                Image(systemName: "car.circle").font(.system(size: 60))
            }
            Text("Transport").font(.system(size: 15))
        }
    }
    var switchToAnimal: some View {
        VStack {
            Button {
                emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐴", "🐍"].shuffled()
                amountOfCards = Int.random(in: 4...emojis.count)
            } label: {
                Image(systemName: "ant.circle").font(.system(size: 60))
            }
            Text("Animal").font(.system(size: 15))
            }
    }
    var switchToFlags: some View {
        VStack {
            Button {
                emojis = ["🇦🇺", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇩🇪", "🇮🇹", "🇪🇸", "🇮🇪", "🇨🇦", "🇷🇺", "🇺🇸", "🇺🇦", "🇯🇵", "🇫🇷", "🇨🇳", "🇰🇿", "🇧🇪"].shuffled()
                amountOfCards = Int.random(in: 4...emojis.count)
            } label: {
                Image(systemName: "flag.circle").font(.system(size: 60))
            }
            Text("Flags").font(.system(size: 15))
        }
    }
}
    
struct CardView: View {
    var content : String
    @State var isFaceUp : Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
