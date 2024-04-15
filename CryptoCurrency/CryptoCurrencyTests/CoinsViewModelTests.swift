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
        let sut = sut()

        await sut.fetchCoins()

        XCTAssertTrue(sut.coins.count > 0) // ensure that coins array has coins
        XCTAssertEqual(sut.coins.count, 20) // ensure that all coins were decoded

        XCTAssertEqual(sut.coins, sut.coins.sorted(by: { $0.marketCapRank < $1.marketCapRank }))
    }

    func test_CoinFetchWithInvalidJSON() async {
        let sut = sut(mockData: mockCoin_invalidJSON)

        await sut.fetchCoins()

        XCTAssertTrue(sut.coins.isEmpty)
        XCTAssertNotNil(sut.errorMessage)
    }

    func test_throwsInvalidDataError() async {
        let sut = sut(mockError: CoinAPIError.invalidData)

        await sut.fetchCoins()

        XCTAssertNotNil(sut.errorMessage)
        XCTAssertEqual(sut.errorMessage, CoinAPIError.invalidData.customDescription)
    }

    func test_throwsInvalidStatusCode() async {

        let sut = sut(mockError: CoinAPIError.invalidStatusCode(statusCode: 404))

        await sut.fetchCoins()

        XCTAssertNotNil(sut.errorMessage)
        XCTAssertEqual(sut.errorMessage, CoinAPIError.invalidStatusCode(statusCode: 404).customDescription)
    }

    private func sut(mockData: Data? = nil, mockError: CoinAPIError? = nil) -> CoinsViewModel {
        let service = MockCoinService()
        service.mockData = mockData
        service.mockError = mockError
        let viewModel = CoinsViewModel(service: service)
        return viewModel
    }
}
