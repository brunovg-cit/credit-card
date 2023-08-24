//
//  Card.swift
//  Pan CredCard
//
//  Created by Bruno Giovane Vivacqua Gaffuri on 23/08/23.
//

import Foundation

struct Card: Codable {
    let alias: String?
    let credit: Bool?
    let debit: Bool?
    let number: String?
    let codSec: String?
    let image: String?
    
    func getSafeCardNumber() -> String {
        let maskedPortion = String(repeating: "**** ", count: 3)
        let safeCardNumber = maskedPortion + lastFourDigits()
        
        return safeCardNumber
    }
    
    func lastFourDigits() -> String {
        if let number = number {
            return String(number.suffix(4))
        }
        return ""
    }
}

extension Card {
    var aliasAccessibilityLabel: String {
         return "Card alias: \(alias ?? "No alias")"
     }
     
     var creditAccessibilityLabel: String {
         return credit == true ? "Credit card" : "Not a credit card"
     }
     
     var debitAccessibilityLabel: String {
         return debit == true ? "Debit card" : "Not a debit card"
     }
     
     var numberAccessibilityLabel: String {
         return "Card number: \(getSafeCardNumber())"
     }
     
     var codSecAccessibilityLabel: String {
         return "Security code: \(codSec ?? "No security code")"
     }
     
     var imageAccessibilityLabel: String {
         return "Card image: \(image ?? "No image")"
     }
}
