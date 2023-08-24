//
//  CardData.swift
//  Pan CredCard
//
//  Created by Bruno Giovane Vivacqua Gaffuri on 23/08/23.
//

import Foundation
import Security
import SwiftUI

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
    
    func downloadCardContent(card: Card, withKey key: String) {
        do {
            let cardData = try JSONEncoder().encode(card)
            guard let cardDataString = String(data: cardData, encoding: .utf8),
                  let secValueData = cardDataString.data(using: .utf8) else {
                print("Error converting card data to string or back to data")
                return
            }
            
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: secValueData
            ]
            
            let status = SecItemAdd(query as CFDictionary, nil)
            if status == errSecSuccess {
                print("Card data saved to keychain")
            } else {
                print("Error saving card data to keychain: \(status)")
            }
        } catch {
            print("Error encoding card data: \(error)")
        }
    }
    
    func retrieveCardData(withKey key: String) -> Card? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status != errSecSuccess {
            print("Error retrieving card data from keychain: \(status)")
            return nil
        }
        
        guard let cardData = item as? Data, let card = try? JSONDecoder().decode(Card.self, from: cardData) else {
            print("Error decoding card data")
            return nil
        }
        
        return card
    }
    
    func deleteCardData(withKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess {
            print("Error deleting card data from keychain: \(status)")
        } else {
            print("Card data deleted from keychain")
        }
    }
}
