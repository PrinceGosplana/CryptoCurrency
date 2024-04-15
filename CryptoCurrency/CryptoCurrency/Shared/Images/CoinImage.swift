//
//  CoinImage.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import SwiftUI

struct CoinImage: View {
    @ObservedObject var imageLoader: ImageLoader
    private let size: CGFloat

    init(urlString: String, size: CGFloat) {
        imageLoader = ImageLoader(urlString: urlString)
        self.size = size
    }

    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
        }
    }
}

#Preview {
    CoinImage(urlString: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", size: 32)
}
