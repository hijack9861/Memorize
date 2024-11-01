//
//  ContentView.swift
//  Memorize
//
//  Created by Jack Yi on 10/26/24.
//

import SwiftUI

struct ContentView: View {
    var viewModel: WeatherSymbolMemoryGame
    
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
            ForEach(weatherSymbols.indices, id: \.self) { index in
                CardView(content: weatherSymbols[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
    
            Group {
                base.fill(Color(red: 0.35, green: 0.51, blue: 0.74))
                Image(systemName: content)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill(Color(red: 0.91, green: 0.91, blue: 0.91)).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
