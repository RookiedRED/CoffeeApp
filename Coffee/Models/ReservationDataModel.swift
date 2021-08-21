//
//  ReservationDataModel.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/21.
//

import Foundation
import SwiftUI

struct reservationData:Codable{
    let date : String
    let people : Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case people
    }
}
