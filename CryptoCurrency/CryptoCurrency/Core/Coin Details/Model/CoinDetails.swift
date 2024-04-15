//
//  CoinDetails.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 14.04.2024.
//

import Foundation

struct CoinDetails: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let description: Description
}

struct Description: Codable {
    let text: String

    enum CodingKeys: String, CodingKey {
        case text = "en"
    }
}
