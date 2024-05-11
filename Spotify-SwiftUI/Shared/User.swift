//
//  User.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import Foundation


// MARK: USERS

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Hashable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phene, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
}
