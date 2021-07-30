//
//  SideMenuShow.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/28.
//

import SwiftUI

class Show :ObservableObject{
    @Published var menu:Bool
    
    init() {
        menu = false
    }
    

}
