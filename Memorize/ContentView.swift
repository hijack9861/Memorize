//
//  ContentView.swift
//  Memorize
//
//  Created by Jack Yi on 10/26/24.
//

import SwiftUI

struct ContentView: View {
    let weatherSymbols = [
        "sun.max",
        "cloud.rain",
        "cloud.sun",
        "tornado",
        "wind",
        "cloud.moon.bolt",
        "cloud.heavyrain",
        "cloud.snow",
        "cloud.fog",
        "cloud.fog.bolt",
        "cloud.fog.rain",
        "cloud.fog.snow",
        "cloud.fog.bolt.rain",
        "cloud.fog.bolt.snow",
        "cloud.fog.bolt.snow"
    ]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: weatherSymbols[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > weatherSymbols.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.circle.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.circle.fill")
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
