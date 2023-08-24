//
//  CardDataTests.swift
//  Pan CredCardTests
//
//  Created by Bruno Giovane Vivacqua Gaffuri on 24/08/23.
//

import XCTest
@testable import PanCredCard

class CardDataTests: XCTestCase {
    
    var cardData: CardData!
    
    override func setUp() {
        super.setUp()
        cardData = CardData()
    }
    
    override func tearDown() {
        cardData = nil
        super.tearDown()
    }
    
    func testRetrieveDataFromJSON() {
        let jsonData = cardData.retrieveDataFromJSON()
        XCTAssertNotNil(jsonData)
    }
    
    func testDownloadAndRetrieveCardData() {
        // Given
        let card = Card(alias: "Test Card", credit: true, debit: false, number: "1234567890123456", codSec: "123", image: nil)
        let key = "testKey"
        
        // When
        cardData.downloadCardContent(card: card, withKey: key)
        let retrievedCard = cardData.retrieveCardData(withKey: key)
        
        // Then
        XCTAssertNotNil(retrievedCard)
        XCTAssertEqual(retrievedCard?.alias, card.alias)
        XCTAssertEqual(retrievedCard?.number, card.number)
        
        cardData.deleteCardData(withKey: key)
    }
    
    func testDeleteCardData() {
        // Given
        let card = Card(alias: "Test Card", credit: true, debit: false, number: "1234567890123456", codSec: "123", image: nil)
        let key = "testKey"
        
        // When
        cardData.downloadCardContent(card: card, withKey: key)
        cardData.deleteCardData(withKey: key)
        
        // Then
        let retrievedCard = cardData.retrieveCardData(withKey: key)
        XCTAssertNil(retrievedCard, "Retrieved card should be nil after deletion")
    }
}
