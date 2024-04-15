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

    private let service: CoinServiceProtocol

    init(service: CoinServiceProtocol) {
        self.service = service

        Task { await fetchCoins() }
    }

    @MainActor
    func fetchCoins() async {
        do {

            let coins = try await service.fetchCoins()
            self.coins.append(contentsOf: coins)
        } catch {
            guard let error = error as? CoinAPIError else { return }
            errorMessage = error.customDescription
        }
    }

}
