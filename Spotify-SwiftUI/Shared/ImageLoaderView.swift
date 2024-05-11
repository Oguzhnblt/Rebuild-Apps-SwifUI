//
//  ImageLoaderView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString = "https://picsum.photos/600/600"
    
    var body: some View {
       WebImage(url: URL(string: urlString))
    }
}

#Preview {
    ImageLoaderView()
}
