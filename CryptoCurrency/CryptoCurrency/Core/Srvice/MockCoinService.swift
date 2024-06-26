//
//  MockCoinService.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import Foundation

final class MockCoinService: CoinServiceProtocol {

    var mockData: Data?
    var mockError: CoinAPIError?

    func fetchCoins() async throws -> [Coin] {
        if let mockError { throw mockError }
        
        do {

            let coins = try JSONDecoder().decode([Coin].self, from: mockData ?? mockCoinData_marketCapDesc)
            return coins
        } catch {
            throw error as? CoinAPIError ?? .unknownError(error: error)
        }
    }
    
    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let testDescription = Description(text: "Test description")
        return CoinDetails(id: "bitcoin", symbol: "btc", name: "Bitcoin", description: testDescription)
    }
}
