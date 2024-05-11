//
//  SpotifyNewReleaseCell.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var onAddPlaylistTapPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Some - title"
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(headline ?? "")
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                    
                    Text(subheadline ?? "")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(.spotifyWhite)
                }
                
                Spacer() // or frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack(spacing: 12) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 150, height: 150)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title ?? "")
                            .foregroundStyle(.spotifyWhite)
                        Text(subtitle ?? "")
                            .foregroundStyle(.spotifyLightGray)
                    }
                    .font(.callout)
                    
                    HStack() {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .offset(x: -4)
                            .onTapGesture {
                                onAddPlaylistTapPressed?()
                            }
                        Spacer()
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                    .padding(.trailing)
                }
            }
            .themeColors(isSelected: false)
        }
        .onTapGesture {
            onPlayPressed?()
        }
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
