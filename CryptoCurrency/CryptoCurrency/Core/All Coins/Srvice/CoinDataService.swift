//
//  CoinDataService.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 13.04.2024.
//

import SwiftUI


actor CoinDataService: HTTPDataDownloader {

    func fetchCoins() async throws -> [Coin] {
        guard let endpoint = allCoinsURLString else {
            throw CoinAPIError.requestFailed(description: "Invalid Endpoint")
        }
        return try await fetchData(as: [Coin].self, endpoint: endpoint)
    }

    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        guard let endpoint = coinDetailRRLString(id: id) else {
            throw CoinAPIError.requestFailed(description: "Invalid Endpoint")
        }
        return try await fetchData(as: CoinDetails.self, endpoint: endpoint)
    }

    // MARK: - Helpers -

    private var baseUrlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com"
        components.path = "/api/v3/coins/"
        return components
    }

    private var allCoinsURLString: String? {
        var components = baseUrlComponents
        components.path += "markets"
        components.queryItems = [
            .init(name: "vs_currency", value: "usd"),
            .init(name: "order", value: "market_cap_desc"),
            .init(name: "per_page", value: "20"),
            .init(name: "page", value: "1"),
            .init(name: "price_change_percentage", value: "24h")
        ]
        return components.url?.absoluteString
    }

    private func coinDetailRRLString(id: String) -> String? {
        var components = baseUrlComponents
        components.path += "\(id)"
        components.queryItems = [
            .init(name: "localization", value: "false")
        ]
        return components.url?.absoluteString
    }

}

