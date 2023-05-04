//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/03.
//

import SwiftUI

struct ProfileHost: View {
    
    // MARK: - Environment-Prop
    @Environment (\.editMode) var editMode
    
    // MARK: - EnvironmentObject-Prop
    @EnvironmentObject var modelData: ModelData
    
    // MARK: - State-Prop
    @State private var draftProfile: Profile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                if (editMode?.wrappedValue == .active) {
                    
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if (editMode?.wrappedValue == .inactive) {
                
                ProfileSummary(profile: modelData.profile)
            } else {
                
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
