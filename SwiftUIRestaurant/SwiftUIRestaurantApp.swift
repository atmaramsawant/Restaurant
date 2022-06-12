//
//  SwiftUIRestaurantApp.swift
//  SwiftUIRestaurant
//
//  Created by SJI on 14/05/21.
//

import SwiftUI
import Firebase

@main
struct SwiftUIRestaurantApp: App {
   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            MenuContainerView(order: Order(), viewModel: viewModel)
                .environmentObject(viewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
