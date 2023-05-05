//
//  PageView.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/04.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    // MARK: - Stored-Prop
    var pages: [Page]
    
    // MARK: - State-Prop
    @State private var currentPage: Int = 0
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map({ FeatureCard(landmark: $0) }))
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
