//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/03.
//

import SwiftUI

struct CategoryHome: View {
    
    // MARK: - EnvironmentObject-Prop
    @EnvironmentObject var modelData: ModelData
    
    // MARK: - State-Prop
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                PageView(pages: modelData.features.map({ FeatureCard(landmark: $0) }))
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
