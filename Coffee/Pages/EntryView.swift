//
//  entryView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/2.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var isShow : Show
    
    //初始化NavigationBar的外觀
    init(){
        navBarInit()
    }
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                ZStack{
                    
                    //各分頁顯示
                    switch isShow.pages {
                    
                    case "會員" : HomeView()
                    case "首頁" : HomeView()
                    case "通知" : NotificationView()
                    case "訂位" : HomeView()//------------yet
                    case "歷史訂位" : BookingHistoryView()
                    case "歷史訂單" : OrderHistoryView()
                    case "活動" : EventView()
                    case "咖啡知識" : KnowledgeView()
                    default:
                        HomeView()
                    }
                    
                    
                    
                }
                .frame(maxWidth:.infinity,maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                
                .blur(radius: isShow.menu||isShow.cart ? 10:0)
                .animation(.easeInOut)
                
                
                SideMenuView(show:$isShow.menu)
            }
            .edgesIgnoringSafeArea(.bottom)
                            
            
            
        }
        
    }
}

struct entryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView().environmentObject(Show())
    }
}
