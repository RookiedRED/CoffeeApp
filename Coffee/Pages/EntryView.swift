//
//  entryView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/2.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var isShow : Show
    var body: some View {
        NavigationView{
            
            ZStack{
                
                switch isShow.pages {
                case "會員" : HomeView()
                case "首頁" : HomeView()//------------yet
                case "通知" : NotificationView()
                case "訂位" : HomeView()//------------yet
                case "歷史訂位" : BookingHistoryView()
                case "歷史訂單" : OrderHistoryView()
                case "活動" : EventView()
                case "咖啡知識" : KnowledgeView()
                default:
                    HomeView()
                }
                
                SideMenuView(show:$isShow.menu)}
            
        }
        
    }
}

struct entryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView().environmentObject(Show())
    }
}
