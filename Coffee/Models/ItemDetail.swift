//
//  ItemDetail.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/5.
//

import Foundation
import SwiftUI

struct ItemDetail: Identifiable {
    var id = UUID()
    var name : String
    var price : Int
    var image : String
    var ice : CGFloat
    var sugar : CGFloat
    var milk : CGFloat
    var number : Int
}

var ItemsInCart=[ItemDetail]()
