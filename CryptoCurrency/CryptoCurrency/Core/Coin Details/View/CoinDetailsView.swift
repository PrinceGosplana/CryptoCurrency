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

    init(service: CoinServiceProtocol, coin: Coin) {
        self.viewModel = CoinDetailsViewModel(service: service, coinId: coin.id)
        self.coin = coin
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let details = viewModel.coinDetails {
                HStack {
                    Text(details.name)
                        .fontWeight(.semibold)
                        .font(.footnote)

                    Text(details.symbol.uppercased())
                        .font(.footnote)

                    Spacer()

                    CoinImage(urlString: coin.image, size: 64)
                }

                Text(details.description.text)
                    .font(.footnote)
                    .padding(.vertical)
            }

            Spacer()
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
