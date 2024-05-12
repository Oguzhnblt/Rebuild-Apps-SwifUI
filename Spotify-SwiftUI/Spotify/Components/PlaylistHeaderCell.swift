//
//  PlaylistHeaderCell.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 12.05.2024.
//

import SwiftfulUI
import SwiftUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Some Title"
    var subtitle: String = "Some Subtitle"
    var imageName: String = "https://picsum.photos/2160/2160"
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(ImageLoaderView(urlString: imageName))
            .overlay (
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .foregroundStyle(.spotifyWhite)
                        .font(.headline)
                    Text(subtitle)
                        .foregroundStyle(.spotifyWhite)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0), shadowColor],
                                       startPoint: .top, endPoint: .bottom)
                    )
                    .foregroundStyle(.spotifyWhite), alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
            .frame(height: 300)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
