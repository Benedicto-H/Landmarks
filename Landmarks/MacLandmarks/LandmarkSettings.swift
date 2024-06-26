//
//  LandmarkSettings.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/08.
//

import SwiftUI

struct LandmarkSettings: View {
    
    // MARK: - AppStorage-Prop
    @AppStorage("MapView.zoom") private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
