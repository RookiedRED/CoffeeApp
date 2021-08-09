//
//  CoffeeApp.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/22.
//

import SwiftUI

@main
struct CoffeeApp: App {
    
    
    var body: some Scene {
        
        WindowGroup {
//            CurveSlider()
            EntryView().environmentObject(Show())
        }
    }
    
}
