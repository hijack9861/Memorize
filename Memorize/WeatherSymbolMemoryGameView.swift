//
//  WeatherSymbolMemoryGameView.swift
//  Memorize
//
//  Created by Jack Yi on 10/26/24.
//

import SwiftUI

struct WeatherSymbolMemoryGameView: View {
    var viewModel: WeatherSymbolMemoryGame = WeatherSymbolMemoryGame()
    
    let weatherSymbols = [
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
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(Color(red: 0.35, green: 0.51, blue: 0.74))
                Image(systemName: card.content)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill(Color(red: 0.91, green: 0.91, blue: 0.91)).opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    WeatherSymbolMemoryGameView()
}
