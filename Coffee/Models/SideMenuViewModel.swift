//
//  SideMenuViewModel.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/28.
//

import Foundation

enum SideMenuViewModel:Int,CaseIterable{
    
    case profile
    case home
    case notification
    case reservation
    case reservationHistory
    case orderHistory
    case event
    case knowledge
    case logout
    
    
    var title:String{
        switch self {
        case .profile: return "會員"
        case .home: return "首頁"
        case .notification: return"通知"
        case .reservation: return"訂位"
        case .reservationHistory: return"歷史訂位"
        case .orderHistory: return"歷史訂單"
        case .event: return"活動"
        case .knowledge: return"咖啡知識"
        case .logout: return"登出"
        }
    }
    
    var imgageName: String{
        switch self {
        case .profile: return "person.circle"
        case .home: return "house"
        case .notification: return"bell"
        case .reservation: return"calendar"
        case .reservationHistory: return"calendar.badge.clock"
        case .orderHistory: return"list.bullet.rectangle"
        case .event: return"megaphone"
        case .knowledge: return"suit.heart"
        case .logout: return"arrow.uturn.backward"
        }
    }
    
}

