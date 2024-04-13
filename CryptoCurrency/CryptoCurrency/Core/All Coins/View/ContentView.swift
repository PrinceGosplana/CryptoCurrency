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
        VStack {
            Text("\(viewModel.coin): \(viewModel.price)")
            Text("")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
