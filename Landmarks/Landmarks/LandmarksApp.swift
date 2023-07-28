//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/04/29.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    // MARK: - StateObject-Prop
    @StateObject private var modelData: ModelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
