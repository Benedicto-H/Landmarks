//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by 홍진표 on 2023/05/07.
//

import SwiftUI

struct NotificationView: View {
    
    // MARK: - Stored-Props
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if (landmark != nil) {
                
                CircleImage(image: landmark!.image.resizable())
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.headline)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            
            NotificationView(title: "Turtle Rock",
                             message: "You are within 5 miles of Turtle Rock.",
                             landmark: ModelData().landmarks[0])
        }
    }
}
