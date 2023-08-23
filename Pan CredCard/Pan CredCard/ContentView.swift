//
//  ContentView.swift
//  Pan CredCard
//
//  Created by Bruno Giovane Vivacqua Gaffuri on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    let cards = CardData().retrieveDataFromJSON() ?? [:]
    var body: some View {
        ScrollView {
            ForEach(cards.keys.sorted(), id: \.self) { key in
                if let card = cards[key] {
                    CardView(card: card)
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
