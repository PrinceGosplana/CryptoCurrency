//
//  CoinDataService.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 13.04.2024.
//

import SwiftUI

final class CoinDataService {

    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false&price_change_percentage=24&locale=en"

    func fetchCoins(completion: @escaping([Coin]) -> Void) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else { return }
            completion(coins)
        }.resume()
    }
}

