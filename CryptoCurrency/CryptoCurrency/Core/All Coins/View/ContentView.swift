//
//  ContentView.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct ContentView: View {

    private let service: CoinServiceProtocol
    @StateObject var viewModel: CoinsViewModel

    init(service: CoinServiceProtocol) {
        self.service = service
        self._viewModel = StateObject(wrappedValue: CoinsViewModel(service: service))
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(value: coin) {
                        HStack(spacing: 12) {
                            Text("\(coin.marketCapRank)")
                                .foregroundStyle(.gray)

                            VStack(alignment: .leading, spacing: 4) {
                                Text(coin.name)
                                    .fontWeight(.semibold)

                                Text(coin.symbol.uppercased())
                            }
                        }
                        .onAppear {
                            if coin == viewModel.coins.last {
                                Task { await viewModel.fetchCoins() }
                            }
                        }
                        .font(.footnote)
                    }
                }
            }
            .navigationDestination(for: Coin.self, destination: { coin in
                CoinDetailsView(service: service, coin: coin)
            })
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
        }
    }
}

#Preview {
    ContentView(service: MockCoinService())
}
