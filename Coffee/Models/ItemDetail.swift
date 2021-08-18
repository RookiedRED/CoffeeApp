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
//public struct City: Codable {
//
//    let name: String
//    let state: String?
//    let country: String?
//    let isCapital: Bool?
//    let population: Int64?
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case state
//        case country
//        case isCapital = "capital"
//        case population
//    }
//
//}
//
//public struct ItemDataSend{
//    let name : String
//    let price : Int?
//    let ice : CGFloat?
//    let sugar : CGFloat?
//    let milk : CGFloat?
//    let number : Int?
//}

class ItemsInCart:ObservableObject{
    @Published var items = [ItemDetail]()
}

