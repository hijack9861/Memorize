//
//  WeatherSymbolMemoryGame.swift
//  Memorize
//
//  Created by Jack Yi on 10/31/24.
//

import SwiftUI

class WeatherSymbolMemoryGame {
    private static let weatherSymbols = [
        "sun.max",
        "cloud.rain",
        "cloud.sun",
        "snowflake",
        "cloud.moon",
        "wind",
        "cloud.moon.bolt",
        "flame",
        "cloud.heavyrain",
        "hurricane",
        "cloud.snow",
        "cloud.fog",
        "cloud.hail",
        "tornado",
        "cloud.drizzle",
        "moon.dust",
        "tropicalstorm",
        "cloud"
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if weatherSymbols.indices.contains(pairIndex) {
                return weatherSymbols[pairIndex]
            } else {
                return "questionmark"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
