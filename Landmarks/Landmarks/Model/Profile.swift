//
//  Profile.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/03.
//

import Foundation

struct Profile {
    
    // MARK: - Type-Prop
    static let `default` = Profile(username: "g_kumar")
    
    // MARK: - Stored-Props
    var username: String
    var prefersNotifications: Bool = true
    var seasonalPhoto: Season = Season.winter
    var goalDate: Date = Date()
    
    // MARK: - Enum Season
    enum Season: String, CaseIterable, Identifiable {
        
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String {
            
            rawValue
        }
    }
}
