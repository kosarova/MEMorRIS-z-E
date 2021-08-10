//
//  MEMorRISEApp.swift
//  MEMorRISE
//
//  Created by Roman Kobzarev on 06.07.2021.
//

import SwiftUI

@main
struct MEMorRISEApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
