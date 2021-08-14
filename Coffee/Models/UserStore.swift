//
//  UeserStore.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/10.
//

import SwiftUI
import Combine

class UserStore: ObservableObject{
    @Published var keepLogging: Bool = UserDefaults.standard.bool(forKey: "keepLogging")
  
    @Published var name:String = UserDefaults.standard.string(forKey: "name") ?? ""

    @Published var phoneNumber:String = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
    
    @Published var email:String = UserDefaults.standard.string(forKey: "email") ?? ""
    
}

