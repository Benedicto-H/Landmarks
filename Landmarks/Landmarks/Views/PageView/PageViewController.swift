//
//  PageViewController.swift
//  Landmarks
//
//  Created by 홍진표 on 2023/05/04.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    // MARK: - Stored-Prop
    var pages: [Page]
    
    // MARK: - State Binding-Prop
    @Binding var currentPage: Int
    
    // MARK: - Method
    func makeCoordinator() -> Coordinator {
        
        Coordinator(self)
    }
    
    // MARK: - UIPageViewController Methods (Required)
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        let pageViewController: UIPageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward, animated: true)
    }
    
    // MARK: - Inner Class
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        // MARK: - Stored-Props
        var parent: PageViewController
        var controllers: [UIViewController] = [UIViewController]()
        
        // MARK: - Initialization
        init(_ pageViewController: PageViewController) {
            
            self.parent = pageViewController
            self.controllers = parent.pages.map({ UIHostingController(rootView: $0) })
        }
        
        // MARK: - UIPageViewControllerDataSource Methods (Required)
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            guard let index: Array<UIViewController>.Index = controllers.firstIndex(of: viewController) else { return nil }
            
            if (index == 0) {
                
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            guard let index: Array<UIViewController>.Index = controllers.firstIndex(of: viewController) else { return nil }
            
            if (index + 1 == controllers.count) {
                
                return controllers.first
            }
            
            return controllers[index + 1]
        }
        
        // MARK: - UIPageViewControllerDelegate Method (Optional)
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            if completed,
               let visibleViewController: UIViewController = pageViewController.viewControllers?.first,
               let index: Array<UIViewController>.Index = controllers.firstIndex(of: visibleViewController) {
                
                parent.currentPage = index
            }
        }
    }
}
