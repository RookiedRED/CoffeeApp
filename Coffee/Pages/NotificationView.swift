//
//  NotificationView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/2.
//

import SwiftUI

struct NotificationView: View {
    
    @EnvironmentObject var isShow : Show
    
    var body: some View {
        
        VStack {
            ScrollView{
                ForEach(0..<2){ _ in
                    CardView_Notification()
                }
                .padding()
            }
        }
        .animation(.easeInOut)
        .navigationTitle("通知")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10),trailing: HeaderButton(show: $isShow.cart, iconImage: "cart").padding(.bottom,10))
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView().environmentObject(Show())
    }
}
