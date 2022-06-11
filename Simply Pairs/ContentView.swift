//
//  ContentView.swift
//  Simply Pairs
//
//  Created by Lakith Jayalath on 2022-06-12.
//

import SwiftUI

struct ContentView: View {
    var vehicles = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐵", "🐤", "🐺", "🦋"]
    var flags = ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇯", "🇧🇲", "🇧🇹", "🇧🇴", "🇱🇰"]
    @State var emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    var body: some View {
        VStack {
            Text("Memorise!")
                .font(.largeTitle)
                .bold()
            Spacer()
            ScrollView {
                let randomNumber = Int.random(in: 4...emojis.count)
//                let evenRandomNumber = (randomNumber % 2 == 0 ? randomNumber : 4)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<randomNumber], id: \.self) { vehicle in
                        CardView(content: vehicle)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicleBtn
                Spacer()
                animalBtn
                Spacer()
                flagBtn
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehicleBtn: some View {
        Button {
            emojis = vehicles
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "car")
                    .font(.title)
                Text("Vehicles")
                    .font(.headline)
            }
        }
    }
    
    var animalBtn: some View {
        Button {
            emojis = animals
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "pawprint")
                    .font(.title)
                Text("Animals")
                    .font(.headline)
            }
        }

    }
    
    var flagBtn: some View {
        Button {
            emojis = flags
            emojis.shuffle()
        } label: {
            VStack{
                Image(systemName: "flag")
                    .font(.title)
                Text("Flags")
                    .font(.headline)
            }
        }

    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        return CGFloat(cardCount) * 25
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
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
    }
}
