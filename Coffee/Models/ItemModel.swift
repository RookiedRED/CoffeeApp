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
    Item(name: "早晨套餐", price: 160, image: "MenuImage.main", level: 5,type:"Set"),
    Item(name: "烤佈雷", price: 110, image: "MenuImage.mind", level: 4,type:"Dessert"),
    Item(name: "拿鐵", price: 70, image: "MenuImage.drinks", level: 4,type:"Drink"),
    Item(name: "美式漢堡", price: 110, image: "MenuImage.hot", level: 5,type:"Meal"),
    Item(name: "早晨套餐", price: 160, image: "MenuImage.main", level: 5,type:"Set"),
    Item(name: "烤佈雷", price: 110, image: "MenuImage.mind", level: 4,type:"Dessert"),
    Item(name: "拿鐵", price: 70, image: "MenuImage.drinks", level: 4,type:"Drink"),
    Item(name: "美式漢堡", price: 110, image: "MenuImage.hot", level: 5,type:"Meal"),
    Item(name: "早晨套餐", price: 160, image: "MenuImage.main", level: 5,type:"Set"),
    
]

//回傳所查找字串的菜單
func search(items:[Item],searchText:String) -> [Item] {
    
    let searchData :[Item] = items
    let searchReturn = searchData.filter{ item in item.name.contains(searchText) }
    
    if searchText == "" { return searchData }
    
    return searchReturn
}


//回傳所選種類的菜單
func menuSearch(type:String) -> [Item] {
    
    let typeData:[Item] = itemsData
    var typeReturn = [Item]()
    
    if type == "All"{ //指標是"ALL"則回傳全部菜單
        return typeData
    }
    else if type == "Hot"{
        
        typeReturn = typeData.filter{ item in item.level > 4 }
    }
    else{
        
        typeReturn = typeData.filter{ item in item.type == type}
    }
    return typeReturn
}

func sort(items:[Item],type:String,order:Bool) ->[Item]{
    
    if type == "價格"{
        if order == true{
            return items.sorted { item1, item2 in
                item1.price > item2.price
            } 
        }else{
            return items.sorted { item1, item2 in
                item1.price < item2.price
            }
        }
    }else if type == "評價分數"{
        if order == true{
            return items.sorted { item1, item2 in
                item1.level > item2.level
            }
        }else{
            return items.sorted { item1, item2 in
                item1.level < item2.level
            }
        }
    }else{
        return items
    }
    
}
