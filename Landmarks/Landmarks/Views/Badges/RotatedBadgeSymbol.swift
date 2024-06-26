//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/02.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    // MARK: - Stored-Prop
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
