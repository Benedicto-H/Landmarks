//
//  Badge.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/02.
//

import SwiftUI

struct Badge: View {
    
    // MARK: - Computed-Prop (-> View as Property)
    var badgeSymbols: some View {
        
        ForEach(0 ..< 8) { index in
            
            RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(8)) * 360.0)
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(
                        CGPoint(
                            x: (geometry.size.width) / 2.0,
                            y: (3.0 / 4.0) * geometry.size.height
                        )
                    )
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
