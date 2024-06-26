//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/04.
//

import SwiftUI

struct ProfileEditor: View {
    
    // MARK: - State Binding-Prop
    @Binding var profile: Profile
    
    // MARK: - Computed-Prop
    var dateRange: ClosedRange<Date> {
        
        let min: Date = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max: Date = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min ... max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo")
                    .bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        
                        Text(season.rawValue)
                            .tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
                    .bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
