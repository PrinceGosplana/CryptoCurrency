//
//  CoinsViewModel.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

final class CoinsViewModel: ObservableObject {

    @Published var coins = [Coin]()

    private let service = CoinDataService()

    init() {
        fetchCoins()
    }

    func fetchCoins() {
        service.fetchCoins { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }

}
