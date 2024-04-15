//
//  CoinsViewModelTests.swift
//  CryptoCurrencyTests
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import XCTest
@testable import CryptoCurrency

final class CoinsViewModelTests: XCTestCase {

    func test_Init() {
        let service = MockCoinService()
        let viewModel = CoinsViewModel(service: service)

        XCTAssertNotNil(viewModel, "The view model should not be nil")
    }

    func test_SuccessfulCoinsFetch() async {
        let service = MockCoinService()
        let viewModel = CoinsViewModel(service: service)

        await viewModel.fetchCoins()
        XCTAssertTrue(viewModel.coins.count > 0) // ensure that coins array has coins
        XCTAssertEqual(viewModel.coins.count, 20) // ensure that all coins were decoded

        XCTAssertEqual(viewModel.coins, viewModel.coins.sorted(by: { $0.marketCapRank < $1.marketCapRank }))
    }

    func test_CoinFetchWithInvalidJSON() async {
        let service = MockCoinService()
        service.mockData = mockCoin_invalidJSON
        let viewModel = CoinsViewModel(service: service)

        await viewModel.fetchCoins()

        XCTAssertTrue(viewModel.coins.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }

    func test_throwsInvalidDataError() async {
        let service = MockCoinService()
        service.mockError = CoinAPIError.invalidData
        let viewModel = CoinsViewModel(service: service)

        await viewModel.fetchCoins()
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, CoinAPIError.invalidData.customDescription)
    }

    func test_throwsInvalidStatusCode() async {
        let service = MockCoinService()
        service.mockError = CoinAPIError.invalidStatusCode(statusCode: 404)
        let viewModel = CoinsViewModel(service: service)

        await viewModel.fetchCoins()
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, CoinAPIError.invalidStatusCode(statusCode: 404).customDescription)
    }
}
