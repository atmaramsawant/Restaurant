//
//  SwiftUIRestaurantApp.swift
//  SwiftUIRestaurant
//
//  Created by SJI on 14/05/21.
//

import SwiftUI
import Firebase
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

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
        AppCenter.start(withAppSecret: "128f8e5b-e8de-45a5-a791-6bce081b4d26", services:[
          Analytics.self,
          Crashes.self
        ])
        return true
    }
}
