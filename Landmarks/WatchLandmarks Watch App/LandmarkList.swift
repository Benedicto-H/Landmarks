//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by 홍진표 on 2023/05/08.
//

import SwiftUI

// MARK: - For watchOS
struct LandmarkList: View {
    
    // MARK: - EnvironmentObject-Prop (= Subscriber)
    @EnvironmentObject var modelData: ModelData
    
    // MARK: - State-Prop
    @State private var showFavoritesOnly: Bool = false
    
    // MARK: - Computed-Prop
    var filteredLandmarks: [Landmark] {
        
        modelData.landmarks.filter { landmark in
            
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
