//
//  CoinsViewModel.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

final class CoinsViewModel: ObservableObject {

    @Published var coins = [Coin]()
    @Published var errorMessage: String?

    private let service = CoinDataService()

    init() {
        Task { try await fetchCoins() }
    }

    @MainActor
    func fetchCoins() async throws {
        coins = try await service.fetchCoins()
    }

}
