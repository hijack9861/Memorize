//
//  ContentView.swift
//  Memorize
//
//  Created by Jack Yi on 10/26/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["sun.max", "cloud.rain", "cloud.sun", "tornado"]
    
    var body: some View {
        HStack {
            ForEach(0..<3, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(Color(red: 0.35, green: 0.51, blue: 0.74))
                //base.stroke(lineWidth: 6)
                Image(systemName: content)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            } else {
                base.fill(Color(red: 0.91, green: 0.91, blue: 0.91))
                //base.stroke(lineWidth: 8)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
