//
//  Spotify_SwiftUIApp.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct Spotify_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}
