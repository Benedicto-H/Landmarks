//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by 홍진표 on 2023/05/07.
//

import SwiftUI

struct LandmarkDetail: View {
    
    // MARK: - EnvironmentObject-Prop
    @EnvironmentObject var modelData: ModelData
    
    // MARK: - Stored-Prop
    var landmark: Landmark
    
    // MARK: - Computed-Prop
    var landmarkIndex: Int {
        
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let modelData: ModelData = ModelData()
        
        return Group {
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Ultra (49mm)")
            
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 8 (45mm)")
            
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 8 (41mm)")
            
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch SE (40mm) (2nd generation)")
        }
    }
}
