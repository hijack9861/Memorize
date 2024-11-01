//
//  WeatherSymbolMemoryGame.swift
//  Memorize
//
//  Created by Jack Yi on 10/31/24.
//

import SwiftUI

class WeatherSymbolMemoryGame {
    private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
