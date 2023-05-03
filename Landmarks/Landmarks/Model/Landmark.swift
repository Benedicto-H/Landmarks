//
//  Landmark.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/04/30.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    
    // MARK: - Stored-Props
    var name: String
    var category: Category
    var state: String
    var id: Int
    var isFeatured: Bool
    var isFavorite: Bool
    var park: String
    var description: String
    
    private var imageName: String
    private var coordinates: Coordinates
    
    // MARK: - Computed-Props
    var image: Image {
        
        Image(imageName)
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }
    
    // MARK: - Inner-Structure
    struct Coordinates: Hashable, Codable {
        
        // MARK: - Stored-Props
        var latitude: Double
        var longitude: Double
    }
    
    // MARK: - Enum Category
    enum Category: String, CaseIterable, Codable {
        
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
