//
//  CoffeeApp.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/22.
//

import SwiftUI
import Firebase


//Firebase初始化
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}


@main
struct CoffeeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    //初始化NavigationBar的外觀
    init(){
        navBarInit()
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            EntryView()
                .environmentObject(Show())//顯示環境
                .environmentObject(UserStore())//用戶資料環境
                .environmentObject(ItemsInCart())//購物車環境
            
        }
    }
    
}
