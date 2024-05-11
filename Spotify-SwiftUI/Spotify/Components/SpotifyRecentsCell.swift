//
//  SpotifyRecentsCell.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some title"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2) 
        }
        .foregroundStyle(.spotifyWhite)
        .padding(.trailing)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .clipShape(.buttonBorder)
    }
}

#Preview {
   SpotifyRecentsCell()
}
