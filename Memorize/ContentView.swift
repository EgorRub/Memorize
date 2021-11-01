//
//  ContentView.swift
//  Memorize
//
//  Created by Егор on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    var emojies: [String] = ["🛩", "🚁", "🚝", "🚘", "🚄", "🚃", "🚟", "🚞", "🚊", "🛬", "🚀", "⛵️", "⛴","🚢", "⚓️" , "🪝", "🗽", "🗿", "🗺", "🏰", "🏯", "🗼", "🎡"]
    @State var emojiesCount: Int = 23
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 200))]) {
                    ForEach(emojies[0..<emojiesCount], id: \.self) { emojie in
                        CardView(content: emojie).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer(minLength: 20)
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button { if emojiesCount > 1 {
            emojiesCount -= 1
        }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button { if emojiesCount < emojies.count {
            emojiesCount += 1
        }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CardView: View {
    var content: String
    @State var isFacedUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFacedUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 8)
                    Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFacedUp = !isFacedUp
        }
    }
}
