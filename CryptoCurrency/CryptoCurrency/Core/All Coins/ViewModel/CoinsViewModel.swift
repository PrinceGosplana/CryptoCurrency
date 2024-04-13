//
//  CoinsViewModel.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

final class CoinsViewModel: ObservableObject {

    @Published var coin = ""
    @Published var price = ""
    @Published var errorMessage: String?

    private let service = CoinDataService()

    init() {
        fetchPrice(coin: "bitcoin")
    }

    func fetchPrice(coin: String) {
        price = service.fetchPrice(coin: coin)
        self.coin = coin
    }
}
