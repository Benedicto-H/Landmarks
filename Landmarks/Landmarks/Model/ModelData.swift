//
//  ModelData.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/04/30.
//

import Foundation
import Combine

// MARK: - Publisher
final class ModelData: ObservableObject {
    
    // MARK: - Published-Prop
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    // MARK: - Stored-Prop
    var hikes: [Hike] = load("hikeData.json")
    
    // MARK: - Computed-Prop
    var categories: [String: [Landmark]] {
        
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    var features: [Landmark] {
        
        landmarks.filter { $0.isFeatured }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
        
        fatalError("Couldn't find \(filename) in main bundle. \n")
    }
    
    do {
        
        data = try Data(contentsOf: file)
    } catch {
        
        fatalError("Couldn't load \(filename) from main bundle: \(error) \n")
    }
    
    do {
        
        let decoder: JSONDecoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    } catch {
        
        fatalError("Couldn't parse \(filename) as \(T.self): \(error) \n")
    }
}
