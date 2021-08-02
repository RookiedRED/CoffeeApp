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
            
            ZStack{ switch isShow.pages {
            case "首頁" : HomeView()
            case "通知" : NotificationView()
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
