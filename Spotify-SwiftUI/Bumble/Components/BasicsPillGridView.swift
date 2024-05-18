//
//  BasicsPillGridView.swift
//  Spotify-SwiftUI
//
//  Created by Oğuzhan Bolat on 18.05.2024.
//

import SwiftUI
import SwiftfulUI

struct BasicsPillGridView: View {
    var basic: [UserInterest] = User.user.basics
    
    var body: some View {
        ZStack{
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: basic) { basic in
                if let basic {
                    PillView(iconName: basic.iconName, emoji: basic.emoji, text: basic.text)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    BasicsPillGridView()
}
