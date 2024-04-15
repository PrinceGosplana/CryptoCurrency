//
//  CoinDetailsViewModel.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 14.04.2024.
//

import Foundation

final class CoinDetailsViewModel: ObservableObject {
    private let service: CoinDataService
    private let coinId: String

    @Published var coinDetails: CoinDetails?

    init(service: CoinDataService, coinId: String) {
        self.service = service
        self.coinId = coinId
    }

    @MainActor
    func fetchCoinDetails() async {
        do {
            coinDetails = try await service.fetchCoinDetails(id: coinId)
        } catch {
            print(error.localizedDescription)
        }
    }
}
