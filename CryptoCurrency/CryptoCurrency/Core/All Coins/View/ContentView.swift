//
//  ContentView.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = CoinsViewModel()
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                Text(coin.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
