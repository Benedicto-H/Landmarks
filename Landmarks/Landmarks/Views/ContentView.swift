//
//  ContentView.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/04/29.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State-Prop
    @State private var selection: Tab = .featured
    
    // MARK: - Enum Tab
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
