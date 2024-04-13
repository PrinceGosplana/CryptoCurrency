//
//  CoinDataService.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 13.04.2024.
//

import SwiftUI

final class CoinDataService {
    func fetchPrice(coin: String) -> String {

        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return "n/a" }

        return "50"
    }
}
