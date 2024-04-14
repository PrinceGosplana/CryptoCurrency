//
//  CoinDetailsView.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 14.04.2024.
//

import SwiftUI

struct CoinDetailsView: View {

    let coin: Coin
    @ObservedObject var viewModel: CoinDetailsViewModel

    init(coin: Coin) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinId: coin.id)
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let details = viewModel.coinDetails {
                Text(details.name)
                    .fontWeight(.semibold)
                    .font(.footnote)

                Text(details.symbol.uppercased())
                    .font(.footnote)

                Text(details.description.text)
                    .font(.footnote)
                    .padding(.vertical)
            }
        }
        .task {
            await viewModel.fetchCoinDetails()
        }
        .padding()
    }
}

//#Preview {
//    CoinDetailsView()
//}
