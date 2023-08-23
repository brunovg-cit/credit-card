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
        List {
            ForEach(cards.keys.sorted(), id: \.self) { key in
                if let card = cards[key] {
                    Text("Card Name: \(key)")
                    Text("Alias: \(card.alias ?? "N/A")")
                    Text("Credit: \(card.credit ?? false ? "Yes" : "No")")
                    Text("Debit: \(card.debit ?? false ? "Yes" : "No")")
                    Text("Number: \(card.number ?? "N/A")")
                    Text("Security Code: \(card.codSec ?? "N/A")")
                    Text("Image: \(card.image ?? "N/A")")
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
