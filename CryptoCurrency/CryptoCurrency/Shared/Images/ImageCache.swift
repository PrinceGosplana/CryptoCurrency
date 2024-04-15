//
//  ImageCache.swift
//  CryptoCurrency
//
//  Created by Oleksandr Isaiev on 15.04.2024.
//

import UIKit

final class ImageCache {
    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()

    private init() {}

    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func get(forKey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
}
