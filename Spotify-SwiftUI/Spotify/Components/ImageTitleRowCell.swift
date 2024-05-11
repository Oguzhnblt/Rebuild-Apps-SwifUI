//
//  ImageTitleRowCell.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 12.05.2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage

    var title: String = "Some Title"
    
    
    var body: some View {
            VStack(alignment: .center, spacing: 8) {
                    ImageLoaderView(urlString: imageName)
                        .frame(width: imageSize, height: imageSize)
                    Text(title)
                        .font(.callout)
                        .foregroundStyle(.spotifyWhite)
                        .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }


#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
        
    }
}
