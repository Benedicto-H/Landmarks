//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/04/30.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationStack {   //  NavigationView (-> iOS 13.0–16.4 Deprecated)
            List(landmarks) { landmark in
                
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 14 Pro", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
            
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
