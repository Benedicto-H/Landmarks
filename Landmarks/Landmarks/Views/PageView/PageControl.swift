//
//  PageControl.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/05.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    // MARK: - Stored-Prop
    var numberOfPages: Int
    
    // MARK: - State Binding-Prop
    @Binding var currentPage: Int
    
    // MARK: - Method
    func makeCoordinator() -> Coordinator {
        
        Coordinator(self)
    }
    
    // MARK: - UIViewRepresentable Methods (Required)
    func makeUIView(context: Context) -> UIPageControl {
        
        let control: UIPageControl = UIPageControl()
        
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentPage
    }
    
    // MARK: - Inner Class
    class Coordinator: NSObject {
        
        // MARK: - Stored-Prop
        var control: PageControl
        
        // MARK: - Initialization
        init(_ control: PageControl) {
            self.control = control
        }
        
        // MARK: - Method (objc)
        @objc func updateCurrentPage(sender: UIPageControl) -> Void {
            
            control.currentPage = sender.currentPage
        }
    }
}
