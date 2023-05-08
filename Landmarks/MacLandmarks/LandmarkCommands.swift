//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/08.
//

import SwiftUI

struct LandmarkCommands: Commands {
    
    // MARK: - FocusedBinding-Prop
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    
    // MARK: - Typealias
    typealias Value = Binding<Landmark>
}

// MARK: - Extension FocusedValues
extension FocusedValues {
    
    // MARK: - Computed-Prop
    var selectedLandmark: Binding<Landmark>? {
        
        get {
            self[SelectedLandmarkKey.self]
        }
        
        set(newValue) {
            self[SelectedLandmarkKey.self] = newValue
        }
    }
}
