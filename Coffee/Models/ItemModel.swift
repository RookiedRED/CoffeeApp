//
//  ItemsModel.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/30.
//

import Foundation
import SwiftUI


struct Item: Identifiable {
    var id = UUID()
    var name : String
    var price : Int
    var image : String
    var level : Int
    var type : String
}

let itemsData = [
    
    Item(name: "拿鐵", price: 70, image: "MenuImage.drinks", level: 4 ,type:"Drink"),
    Item(name: "美式漢堡", price: 110, image: "MenuImage.hot", level: 5,type:"Meal"),
    Item(name: "蛋糕套餐", price: 160, image: "MenuImage.main", level: 5,type:"Set"),
    Item(name: "烤佈雷", price: 110, image: "ManuImage.mind", level: 4,type:"Dessert"),
    Item(name: "拿鐵", price: 70, image: "MenuImage.drinks", level: 4,type:"Drink"),
    Item(name: "美式漢堡", price: 110, image: "MenuImage.hot", level: 5,type:"Meal"),
    Item(name: "蛋糕套餐", price: 160, image: "MenuImage.main", level: 5,type:"Set"),
    Item(name: "烤佈雷", price: 110, image: "ManuImage.mind", level: 4,type:"Dessert"),
    Item(name: "拿鐵", price: 70, image: "MenuImage.drinks", level: 4,type:"Drink"),
    Item(name: "美式漢堡", price: 110, image: "MenuImage.hot", level: 5,type:"Meal"),
    Item(name: "蛋糕套餐", price: 160, image: "MenuImage.main", level: 5,type:"Set"),
    

]


func search(searchText:String) -> [Item] {
    
    let searchData :[Item] = itemsData
    var searchReturn = [Item]()

    for i in 0..<searchData.count{
        if searchData[i].name.contains(searchText) {
            searchReturn.append(searchData[i])
        }
    }
    
    return searchReturn
}


func menuSearch(type:String) -> [Item] {
    
    let typeData:[Item] = itemsData
    var typeReturn = [Item]()
    
    if type == "All"{
        return typeData
    }
    else if type == "Hot"{
        for i in 0..<typeData.count{
            if typeData[i].level > 4{
                typeReturn.append(typeData[i])
            }
        }
    }
    else{
        for i in 0..<typeData.count{
            if type == typeData[i].type{
                typeReturn.append(typeData[i])
            }
        }
    }
    
    return typeReturn
}
