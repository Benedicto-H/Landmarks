//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by 홍진표 on 2023/05/07.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    // MARK: - Stored-Props
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey: String = "landmarkIndex"
    
    // MARK: - Override Methods
    override var body: NotificationView {
        
        NotificationView(title: title,
                         message: message,
                         landmark: landmark)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        
        let modelData: ModelData = ModelData()
        
        let notificationData: [String: Any]? = notification.request.content.userInfo as? [String: Any]
        
        let aps: [String: Any]? = notificationData?["aps"] as? [String: Any]
        let alert: [String: Any]? = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index: Int = notificationData?[landmarkIndexKey] as? Int {
            
            landmark = modelData.landmarks[index]
        }
    }
}
