//
//  NavBarAppearance.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/28.
//

import SwiftUI

func navBarInit() {
    let barAppearance = UINavigationBarAppearance()
    
    let attrs = [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "American Typewriter Bold", size: 24)!
    ]
    
    barAppearance.titleTextAttributes = attrs
    barAppearance.backgroundImage = UIImage(named: "NavBar")
    UINavigationBar.appearance().standardAppearance = barAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
}
