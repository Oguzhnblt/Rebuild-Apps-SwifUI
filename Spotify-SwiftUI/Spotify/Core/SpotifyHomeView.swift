//
//  SpotifyHomeView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuz on 11.05.2024.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 1 ,pinnedViews: [.sectionHeaders], content: {
                    Section {
                        VStack(spacing: 20) {
                            recentSection
                            if let product = products.first {
                                newReleaseSection(product: product)
                            }
                            ForEach(productRows) { row in
                                VStack(spacing: 8) {
                                    Text(row.title)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.spotifyWhite)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ScrollView(.horizontal) {
                                        HStack(alignment: .top,spacing: 16) {
                                            ForEach(row.products) { product in
                                                
                                                ImageTitleRowCell(imageSize: 120,
                                                                  imageName: product.firstImage,
                                                                  title: product.title
                                                )
                                            }
                                        }
                                        .padding(.horizontal, 16)
                                    }
                                    .scrollIndicators(.hidden)
                                }
                            }
                        }
                        .padding(.horizontal, 8)
                    } header: {
                        headerSection
                    }
                })
                .padding(.top,8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            
            productRows = rows
            
        } catch {
            print("Veri alınırken bir hata oluştu: \(error.localizedDescription)")
            
        }
    }
    
    private var headerSection: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            // Profil ekranına gidecek
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(.spotifyBlack)
    }
    
    private var recentSection: some View {
        NonLazyVGrid(columns: 2, items: products, content: { product in
            if let product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                )
                .asButton(.press) {
                   // İlgili ürüne gidecek
                }
            }
        })
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(onAddPlaylistTapPressed: {},
                              onPlayPressed: {},
                              imageName: product.firstImage,
                              headline: product.brand,
                              subheadline: product.category,
                              title: product.title,
                              subtitle: product.description)
    }
}


#Preview {
    SpotifyHomeView()
}
