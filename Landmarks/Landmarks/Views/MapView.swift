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
    
    // MARK: - State-Prop
    @State private var region: MKCoordinateRegion = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                
                setRegion(coordinate)
            }
    }
    
    // MARK: - Method
    private func setRegion(_ coordinate: CLLocationCoordinate2D) -> Void {
        
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
