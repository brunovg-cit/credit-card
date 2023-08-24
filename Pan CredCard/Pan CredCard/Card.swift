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
