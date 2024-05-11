//
//  Product.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import Foundation

// MARK: PRODUCTS
struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
