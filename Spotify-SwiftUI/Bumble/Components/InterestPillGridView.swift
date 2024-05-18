//
//  InterestPillGridView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuzhan Bolat on 18.05.2024.
//

import SwiftUI
import SwiftfulUI

struct UserInterest {
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct InterestPillGridView: View {
    var interest: [UserInterest] = User.user.interests
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interest) { interest in
                if let interest {
                    PillView(iconName: interest.iconName, emoji: interest.emoji, text: interest.text)
                } else {
                  EmptyView()
                }
            }
        }
    }
}

#Preview {
    InterestPillGridView()
}
