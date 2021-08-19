//
//  ItemDetail.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/5.
//

import Foundation
import SwiftUI

struct ItemDetail: Identifiable{
    var id = UUID()
    var name : String
    var price : Int
    var image : String
    var ice : CGFloat
    var sugar : CGFloat
    var milk : CGFloat
    var number : Int
}

struct orderDataModel:Codable{
    let name : String
    let price : Int?
    let ice : CGFloat?
    let sugar : CGFloat?
    let milk : CGFloat?
    let number : Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case price
        case ice
        case sugar
        case milk
        case number 
    }
}

struct orderDatas:Codable {
    var takeDate:String
    var orders:[orderDataModel]
    
    enum CodingKeys: String, CodingKey {
        case takeDate
        case orders
    }
}


class ItemsInCart:ObservableObject{
    @Published var items = [ItemDetail]()
}

