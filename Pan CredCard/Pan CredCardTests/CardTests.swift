//
//  CardTests.swift
//  Pan CredCardTests
//
//  Created by Bruno Giovane Vivacqua Gaffuri on 24/08/23.
//

import XCTest
@testable import Pan_CredCard

class CardTests: XCTestCase {
    
    func testLastFourDigits() {
        let card = Card(alias: "Test Card", credit: true, debit: false, number: "1234567890123456", codSec: "123", image: nil)
        let lastFourDigits = card.lastFourDigits()
        // Last four digits should be '3456'
        XCTAssertEqual(lastFourDigits, "3456")
    }
    
    func testLastFourDigitsWithNilNumber() {
        let card = Card(alias: "Test Card", credit: true, debit: false, number: nil, codSec: "123", image: nil)
        let lastFourDigits = card.lastFourDigits()
        // Last four digits should be an empty string
        XCTAssertEqual(lastFourDigits, "")
    }
    
    func testGetSafeCardNumber() {
        let card = Card(alias: "Test Card", credit: true, debit: false, number: "1234567890123456", codSec: "123", image: nil)
        let safeCardNumber = card.getSafeCardNumber()
        // Safe card number should be '**** **** **** 3456'
        XCTAssertEqual(safeCardNumber, "**** **** **** 3456")
    }
    
    func testGetSafeCardNumberWithNilNumber() {
        let card = Card(alias: "Test Card", credit: true, debit: false, number: nil, codSec: "123", image: nil)
        let safeCardNumber = card.getSafeCardNumber()
        // Safe card number should be '**** **** **** '
        XCTAssertEqual(safeCardNumber, "**** **** **** ")
    }
}
