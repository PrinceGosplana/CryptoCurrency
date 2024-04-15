//
//  MockCoinService.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import Foundation

final class MockCoinService: CoinServiceProtocol {
    func fetchCoins() async throws -> [Coin] {
        [Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", currentPrice: 6000, marketCapRank: 1)]
    }
    
    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let testDescription = Description(text: "Test description")
        return CoinDetails(id: "bitcoin", symbol: "btc", name: "Bitcoin", description: testDescription)
    }
}
