//
//  PlaylistDescriptionCell.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 12.05.2024.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText: String = mockProduct1.description
    var userName: String = "Oğuzhan"
    var subheadline: String = "Laptops"
    
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(descriptionText)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(subheadline)
                .foregroundStyle(.spotifyWhite)
                .font(.callout)
            
            buttonsSection
        }
        .padding(8)
    }
    
    private var madeForYouSection: some View {
        HStack(alignment: .center) {
            Image(systemName: "apple.logo")
                .foregroundColor(.spotifyGreen)
                .font(.title3)
            Text("Made for")
                .foregroundStyle(.spotifyWhite)
                .font(.callout)
            Text(userName)
                .foregroundStyle(.spotifyWhite)
                .bold()
                .font(.callout)
        }
    }
    
    private var buttonsSection: some View {
        HStack(alignment: .center) {
            Image(systemName: "plus.circle")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
            
            Image(systemName: "arrow.down.circle")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
            
            Image(systemName: "square.and.arrow.up")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
            
            Image(systemName: "ellipsis")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
            
            Spacer()
            Image(systemName: "shuffle")
                .font(.system(size: 24))
                .foregroundStyle(.spotifyGreen)
                .padding(8)
                .onTapGesture {
                    
                }
            
            Image(systemName: "play.circle.fill")
                .padding(8)
                .font(.system(size: 46))
                .foregroundStyle(.spotifyGreen)
                .onTapGesture {
                    
                }
        }
        .offset(x: -8)
        .foregroundColor(.spotifyWhite)
        .font(.title2)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        PlaylistDescriptionCell()
    }
    
}
