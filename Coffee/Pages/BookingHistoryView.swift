//
//  BookingHistoryView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/3.
//

import SwiftUI

struct BookingHistoryView: View {
    @EnvironmentObject var isShow : Show
    @State private var isShowMenu = false
    
    var body: some View {
        
        VStack {
            ScrollView{
                ForEach(0..<1){ _ in
                    CardView_BookingHistory()
                }
                .padding()
            }
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .blur(radius: isShow.menu||isShow.cart ? 10:0)
        .animation(.easeInOut)
        .navigationTitle("歷史訂位")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10),trailing: HeaderButton(show: $isShow.cart, iconImage: "cart").padding(.bottom,10))
        
    }
}

struct BookingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BookingHistoryView().environmentObject(Show())
    }
}
