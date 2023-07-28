//
//  HikeBadge.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/03.
//

import SwiftUI

struct HikeBadge: View {
    
    // MARK: - Stored-Prop
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
