//
//  CardData.swift
//  Pan CredCard
//
//  Created by Bruno Giovane Vivacqua Gaffuri on 23/08/23.
//

import Foundation

class CardData {
    func retrieveDataFromJSON() -> [String: Card]? {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([String: Card].self, from: data)
                return jsonData
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        } else {
            print("Error finding JSON file in main bundle")
        }
        return nil
    }
}
