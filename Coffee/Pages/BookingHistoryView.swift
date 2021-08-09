//
//  BookingHistoryView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/3.
//

import SwiftUI

struct BookingHistoryView: View {
    @EnvironmentObject var isShow : Show
    
    var body: some View {
        
        VStack {
            ScrollView{
                ForEach(0..<1){ _ in
                    CardView_BookingHistory()
                }
                .padding()
            }
        }
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
