//
//  Coin.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 13.04.2024.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
}
