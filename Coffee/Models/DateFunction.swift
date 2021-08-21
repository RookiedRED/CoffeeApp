//
//  DateFunction.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/21.
//

import Foundation


//獲得台灣地區當前時間
func getNowDate() -> String {
    let nowDate: Date = Date()
    let dateFormatter: DateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yy-MM-dd HH:mm:ss"
    dateFormatter.locale = Locale(identifier: "zh_Hant_TW") // 設定地區(台灣)
    dateFormatter.timeZone = TimeZone(identifier: "Asia/Taipei") // 設定時區(台灣)
    let dateFormatString:String = dateFormatter.string(from: nowDate)
    return dateFormatString
}
