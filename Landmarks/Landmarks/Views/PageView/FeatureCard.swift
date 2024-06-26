//
//  FeatureCard.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/04.
//

import SwiftUI

struct FeatureCard: View {
    
    // MARK: - Stored-Prop
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(content: {
                TextOverlay(landmark: landmark)
            })
    }
}

// MARK: - SubView
struct TextOverlay: View {
    
    // MARK: - Stored-Prop
    var landmark: Landmark
    
    // MARK: - Computed-Prop
    var gradient: LinearGradient {
        
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
