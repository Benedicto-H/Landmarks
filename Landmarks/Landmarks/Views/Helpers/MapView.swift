//
//  MapView.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/04/29.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - Stored-Prop
    var coordinate: CLLocationCoordinate2D
    
    // MARK: - AppStorage-Prop
    @AppStorage("MapView.zoom") private var zoom: Zoom = .medium
    
    // MARK: - Enum Zoom
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            
            return self
        }
    }
    
    // MARK: - Computed-Props
    var delta: CLLocationDegrees {
        
        switch zoom {
        case .near:
            return 0.02
            
        case .medium:
            return 0.2
            
        case .far:
            return 2
        }
    }
    
    var region: MKCoordinateRegion {
        
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: delta,
                longitudeDelta: delta)
        )
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
