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
    }

    @MainActor
    func fetchCoins() async {
        do {
            coins = try await service.fetchCoins()
        } catch {
            guard let error = error as? CoinAPIError else { return }
            errorMessage = error.customDescription
        }
    }

}
