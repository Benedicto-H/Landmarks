//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/02.
//

import SwiftUI

struct BadgeSymbol: View {
    
    // MARK: - Type-Prop
    static let symbolColor: Color = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            
            Path { path in
                
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height: CGFloat = width * 0.75
                
                let spacing: CGFloat = width * 0.030
                let middle: CGFloat = width * 0.5
                let topWidth: CGFloat = width * 0.226
                let topHeight: CGFloat = height * 0.488
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: (middle - topWidth), y: (topHeight - spacing)),
                    CGPoint(x: middle, y: (topHeight / 2) + spacing),
                    CGPoint(x: (middle + topWidth), y: (topHeight - spacing)),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: ((topHeight / 2) + (spacing * 3))))
                
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
