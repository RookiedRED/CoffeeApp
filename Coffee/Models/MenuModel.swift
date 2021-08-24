//
//  MenuModel.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/30.
//

import Foundation

struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var image : String
    var type : String
    
}

let menusData = [
    Menu(title: "熱門餐點", image: "MenuImage.hot",type:"Hot"),
    Menu(title: "全部餐點", image: "MenuImage.main",type:"All"),
    Menu(title: "套餐", image: "MenuImage.mind",type:"Set"),
    Menu(title: "飲料", image: "MenuImage.drinks",type:"Drink")
    
]
