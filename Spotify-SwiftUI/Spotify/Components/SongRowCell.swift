//
//  SongRowCell.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 12.05.2024.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageSize: CGFloat = 55
    var imageName: String = Constants.randomImage
    var title: String = "iPhone 9"
    var subtitle: String = "Apple"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(alignment: .center) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 8){
                Text(title)
                    .foregroundStyle(.spotifyWhite)
                    .font(.body)
                Text(subtitle)
                    .foregroundStyle(.spotifyLightGray)
                    .font(.callout)
            }
            .lineLimit(2)
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundStyle(.spotifyWhite)
                .font(.subheadline)
                .padding(16)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
        .offset(y: -8)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SongRowCell()
    }
}
