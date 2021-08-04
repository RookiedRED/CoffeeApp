//
//  SideMenuShow.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/28.
//

import SwiftUI
import Combine

class Show :ObservableObject{
    
    @Published var menu:Bool
    @Published var cart:Bool
    @Published var pages:String
    
    
    init() {
        menu = false
        cart = false
        pages = "Home"
        
    }
    

}
