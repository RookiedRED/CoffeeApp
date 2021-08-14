//
//  CoffeeApp.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}


@main
struct CoffeeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var user = UserStore()
    
    var body: some Scene {
        
        WindowGroup {
            EntryView()
                .environmentObject(Show())
                .environmentObject(user)
        }
    }
    
}
