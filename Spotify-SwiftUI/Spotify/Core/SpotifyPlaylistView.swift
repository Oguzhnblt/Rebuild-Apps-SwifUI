//
//  SpotifyPlaylistView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 12.05.2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    var product: Product?
    var user : User?
    
    @Environment(\.router) var router
    @State private var products: [Product] = []
    @State private var showHeader: Bool = false
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
             
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    if let product = product {
                        PlaylistHeaderCell(height: 300,
                                           title: product.brand,
                                           subtitle: product.title,
                                           imageName: product.firstImage,
                                           shadowColor: .spotifyBlack.opacity(0.8)
                        )
                        .readingFrame { frame in
                            offset = frame.maxY
                            showHeader = frame.maxY < 150 ? true : false
                        }
                        
                        PlaylistDescriptionCell(
                            descriptionText: product.description,
                            userName: user?.firstName ?? "",
                            subheadline: product.category,
                            onAddToPlaylistPressed: nil,
                            onDownloadPressed: nil,
                            onSharePressed: nil,
                            onEllipsisPressed: nil,
                            onShufflePressed: nil,
                            onPlayPressed: nil
                        )
                        
                    }
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: {
                                goToPlaylistView(product: product)
                            },
                            onEllipsisPressed: nil
                        )
                    }
                }
            }

            .scrollIndicators(.hidden)
            
            header
            
            .task {
                await getData()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    private var header: some View {
        ZStack {
            if let product = product  {
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .offset(y: showHeader ? 0 : -200)
                    .background(.spotifyBlack)
                    .opacity (showHeader ? 1 : 0)
                
                Image (systemName:"chevron.left")
                    .font(.title3)
                    .padding (10)
                    .background (showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                    .clipShape (Circle())
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundStyle(.spotifyWhite)
        .frame(maxHeight: .infinity, alignment: .top)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
    
    private func goToPlaylistView(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
    
    
    private func getData() async {
        do {
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
        } catch {
            print("Veri alınırken bir hata oluştu: \(error.localizedDescription)")
            
        }
    }
}

#Preview {
    RouterView{ _ in
        SpotifyPlaylistView()
    }
}
