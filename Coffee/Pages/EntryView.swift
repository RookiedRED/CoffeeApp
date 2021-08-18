//
//  entryView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/2.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var isShow : Show
    @EnvironmentObject var user: UserStore
    @EnvironmentObject var itemsInCart: ItemsInCart
    

    
    //判斷會員是否登入來回傳登入或會員畫面
    func UserView(isLogged:Bool) -> AnyView {
        if isLogged{
            return AnyView(UserInformationView().environmentObject(user))
        }else{
            return AnyView(LoginView().environmentObject(user))
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        NavigationView{
            
            ZStack {
                ZStack{
                    
                    //各分頁顯示
                    switch isShow.pages {
                    case "會員" : UserView(isLogged:(user.keepLogging))
                    case "首頁" : HomeView().environmentObject(itemsInCart)
                    case "通知" : NotificationView().environmentObject(itemsInCart)
                    case "訂位" : HomeView()//------------yet
                    case "歷史訂位" : BookingHistoryView().environmentObject(itemsInCart)
                    case "歷史訂單" : OrderHistoryView().environmentObject(itemsInCart)
                    case "活動" : EventView().environmentObject(itemsInCart)
                    case "咖啡知識" : KnowledgeView().environmentObject(itemsInCart)
                    case "登出" : LoginView()
                    default:
                        HomeView()
                    }
                    
                }
                .environmentObject(user)
                .frame(maxWidth:.infinity,maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .onTapGesture{
                    hideKeyboard()
                }
                .blur(radius: isShow.menu ? 10:0)
                .animation(.easeInOut)
                //側邊菜單欄
                SideMenuView(show:$isShow.menu)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            
            
        }
    }
}

struct entryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
            .environmentObject(Show())
            .environmentObject(UserStore())
            .environmentObject(ItemsInCart())
    }
}
