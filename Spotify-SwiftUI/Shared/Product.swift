//
//  Product.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import Foundation

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
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
}

let mockProduct1 = Product(id: 1,
                            title: "Smartphone",
                            description: "MacBook Pro 2021 with mini-LED display may launch between September, November.",
                            price: 1000,
                            discountPercentage: 10,
                            rating: 4.5,
                            stock: 50,
                            brand: "Apple",
                            category: "Electronics",
                            thumbnail: "phone_thumbnail.jpg",
                            images: [Constants.randomImage])

let mockProduct2 = Product(id: 2,
                            title: "Wireless Headphones",
                            description: "Wireless headphones with noise-cancelling feature.",
                            price: 150,
                            discountPercentage: 20,
                            rating: 4.2,
                            stock: 100,
                            brand: "Samsung",
                            category: "Electronics",
                            thumbnail: "headphones_thumbnail.jpg",
                            images: [Constants.randomImage])

let mockProduct3 = Product(id: 3,
                            title: "Running Shoes",
                            description: "High-performance running shoes.",
                            price: 200,
                            discountPercentage: 0,
                            rating: 4.7,
                            stock: 30,
                            brand: "Xiaomi",
                            category: "Sports",
                            thumbnail: "shoes_thumbnail.jpg",
                            images: [Constants.randomImage])


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
