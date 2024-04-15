//
//  HTTPDataDownloader.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import SwiftUI

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T
}

extension HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T {

        guard let url = URL(string: endpoint) else { throw CoinAPIError.invalidURL }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinAPIError.requestFailed(description: "Request failed")
        }

        guard httpResponse.statusCode == 200 else {
            throw CoinAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error as? CoinAPIError ?? .unknownError(error: error)
        }
    }
}
