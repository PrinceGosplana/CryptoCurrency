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
        fetchCoins()
    }

    func fetchCoins() {
        service.fetchCoins { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }

            }
        }
    }

}
