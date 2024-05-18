//
//  PillView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuzhan Bolat on 18.05.2024.
//

import SwiftUI

struct PillView: View {
    
    var iconName: String? = "heart.fill"
    var emoji: String? = "👍🏻"
    var text: String = "Graduate Degree"
    
    var body: some View {
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleYellow)
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    PillView()
}
