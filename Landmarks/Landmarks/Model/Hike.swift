//
//  Hike.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/02.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    
    // MARK: - Type-Prop
    static var formatter: LengthFormatter = LengthFormatter()
    
    // MARK: - Stored-Props
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    // MARK: - Computed-Prop
    var distanceText: String {
        
        Hike.formatter.string(fromValue: distance, unit: .kilometer)
    }
    
    // MARK: - Inner Structure
    struct Observation: Codable, Hashable {
        
        // MARK: - Stored-Props
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        var distanceFromStart: Double
    }
}
