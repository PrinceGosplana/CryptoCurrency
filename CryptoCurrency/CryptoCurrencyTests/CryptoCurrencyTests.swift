//
//  CryptoCurrencyTests.swift
//  CryptoCurrencyTests
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import XCTest
@testable import CryptoCurrency

final class CryptoCurrencyTests: XCTestCase {

    func test_DecodeCoinsIntoArray_marketCapDesc() throws {
        do {
            let coins = try JSONDecoder().decode([Coin].self, from: mockCoinData_marketCapDesc)
            XCTAssertTrue(coins.count > 0) // ensure that coins array has coins
            XCTAssertEqual(coins.count, 20) // ensure that all coins were decoded

            XCTAssertEqual(coins, coins.sorted(by: { $0.marketCapRank < $1.marketCapRank }))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
