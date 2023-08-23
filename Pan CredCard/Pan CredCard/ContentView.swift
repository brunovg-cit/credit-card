//
//  ContentView.swift
//  Pan CredCard
//
//  Created by Bruno Giovane Vivacqua Gaffuri on 23/08/23.
//

import SwiftUI
import Security

struct ContentView: View {
    let cardData = CardData()
    
    var body: some View {
        let cards = cardData.retrieveDataFromJSON() ?? [:]
        
        ScrollView {
            ForEach(cards.keys.sorted(), id: \.self) { key in
                if let card = cards[key] {
                    CardView(card: card, cardName: key)
                    Divider()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
