//
//  SpotifyPlaylistView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 12.05.2024.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(height: 300,
                                       title: mockProduct1.brand,
                                       subtitle: mockProduct1.title,
                                       imageName: mockProduct1.images.first!,
                                       shadowColor: .spotifyBlack.opacity(0.8)
                    )
                    
                    PlaylistDescriptionCell(
                        descriptionText: mockProduct1.description,
                        userName: "Oğuz",
                        subheadline: mockProduct1.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                }
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
