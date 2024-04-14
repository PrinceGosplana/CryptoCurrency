//
//  Coin.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 13.04.2024.
//

import Foundation

struct Coin: Codable, Identifiable, Hashable {
    let id: String
    let symbol: String
    let name: String
    let currentPrice: Double
    let marketCapRank: Int

    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
    }

}
