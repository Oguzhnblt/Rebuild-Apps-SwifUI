//
//  User.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let height: Double
    let email, phone, username, password: String
    let image: String
    
    var work: String {
        "Worker as Some Job"
    }
    
    var education: String {
        "Graduate Degree"
    }
    
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile!"
    }
    
    var location: String {
        "New York, NY"
    }
    
    var basics: [UserInterest] {
        [UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
         UserInterest (iconName: "graduationcap", emoji: nil, text: education),
         UserInterest (iconName: "wineglass", emoji: nil, text: "Socially"),
         UserInterest (iconName: "moon.stars.fill", emoji: nil, text: "Virgo")
        ]
    }
    
    var images: [String] {
        [
            "https://picsum.photos/1920/1080", "https://picsum.photos/2160/1080", "https://picsum.photos/1600/1600"
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(
                iconName: nil,
                emoji: "🏃🏻‍♂️‍➡️",
                text: "Running"
            ),
            UserInterest (
                iconName: nil,
                emoji: "🏋🏻‍♀️",
                text: "Gym"
            ),
            UserInterest (
                iconName: nil,
                emoji: "🎧",
                text: "Music"
            ),
            UserInterest (
                iconName: nil,
                emoji: "🍪",
                text: "Cooking"
            )
        ]
    }
    
    
    static let user = User(
        id: 1,
        firstName: "John",
        lastName: "Doe",
        age: 30,
        height: 1.87,
        email: "john.doe@example.com",
        phone: "1234567890",
        username: "johndoe123",
        password: "password123",
        image: "https://picsum.photos/600/600"
    )
}

