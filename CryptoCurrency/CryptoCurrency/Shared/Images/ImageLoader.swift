//
//  ImageLoader.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import SwiftUI

actor ImageLoader: ObservableObject {
    @MainActor @Published var image: Image?

    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString

        Task { await loadImage() }
    }

    @MainActor
    private func loadImage() async {

        if let cached = ImageCache.shared.get(forKey: urlString) {
            image = Image(uiImage: cached)
            return
        }

        guard let url = URL(string: urlString) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let uiImage = UIImage(data: data) else { return }
            ImageCache.shared.set(uiImage, forKey: urlString)
            image = Image(uiImage: uiImage)
        } catch {
            print(error.localizedDescription)
        }
    }
}
