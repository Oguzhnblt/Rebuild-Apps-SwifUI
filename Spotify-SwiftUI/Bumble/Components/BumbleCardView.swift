//
//  BumbleCardView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuzhan Bolat on 18.05.2024.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var onSendAComplimentPressed: (() -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    var onCheckmarkPressed: (() -> Void)? = nil
    var onHideAndReportPressed: (() -> Void)? = nil
    var onSuperLikePressed: (() -> Void)? = nil
    
    var user: User = .user
    @State private var cardFrame: CGRect = .zero
    
    
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                headerCell
                    .frame(height: cardFrame.height)
                aboutMeSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                myInterestSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                ForEach(user.images, id:\.self) {image in
                    ImageLoaderView(urlString: image)
                        .frame(height: cardFrame.height)
                }
                locationSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                footerSection
                    .padding(.top, 60)
                    .padding(.bottom, 60)
                    .padding(.horizontal, 20)
                
                
            }
        }
        .background(.bumbleLightYellow)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .readingFrame { frame in
            cardFrame = frame
        }
        .scrollIndicators(.hidden)
        .overlay(
        superLikeBumbleButton
            .padding(24), alignment: .bottomTrailing
        )
      
    }
    
    
    private func sectionTitle(title: String) -> some View {
        return Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }
    
    private var superLikeBumbleButton: some View {
      
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay(
                Image(systemName: "star.fill")
                    .font(.system(size: 30, weight: .medium))
            )
            .onTapGesture {
                onSuperLikePressed?()
            }
    }
    
    private var footerSection: some View {
        VStack(spacing: 24) {
            HStack(spacing: 0) {
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(
                    Image(systemName: "xmark")
                        .foregroundStyle(.bumbleBlack)
                        .font(.title)
                        .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onXmarkPressed?()
                    }
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(
                    Image(systemName: "checkmark")
                        .foregroundStyle(.bumbleBlack)
                        .font(.title)
                        .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onCheckmarkPressed?()
                    }
            }
            .padding(.horizontal, 12)
            
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(.bumbleBlack.opacity(0.001))
                .onTapGesture {
                    onHideAndReportPressed?()
                }
        }

    }
    
    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text("\(user.firstName)'s Location")
                    .font(.body)
            }
            .foregroundStyle(.bumbleGray)
            
            Text("10 miles away")
                .fontWeight(.medium)
                .foregroundStyle(.bumbleBlack)
            
            PillView(iconName: nil, emoji: "🇺🇸", text: "Lives in \(user.location)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var myInterestSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Basics")
                BasicsPillGridView()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Interest")
                InterestPillGridView()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle(title: "About Me")
            Text(user.aboutMe)
            
            
            HStack(spacing: 0) {
                BumbleHeartView()
                Text("Send a Compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 8)
            .background(.bumbleYellow)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .onTapGesture {
                onSendAComplimentPressed?()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var headerCell: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(urlString: user.image)
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "graduationcap")
                    Text(user.work)
                }
                
                BumbleHeartView()
                    .onTapGesture {
                        // TODO: Fonksiyon eklenecek
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .background(
                LinearGradient(
                    colors: [.bumbleBlack.opacity(0),
                             .bumbleBlack.opacity(0.6),
                             .bumbleBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
