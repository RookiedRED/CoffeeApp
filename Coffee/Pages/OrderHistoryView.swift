//
//  OrderHistoryView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/2.
//

import SwiftUI

struct OrderHistoryView: View {
    @EnvironmentObject var isShow : Show
    @EnvironmentObject var itemsInCart: ItemsInCart
    @EnvironmentObject var user: UserStore
    var body: some View {
        
        VStack {
            ScrollView{
                ForEach(0..<1){ _ in
                    CardView_OrderHistory()
                }
                .padding()
            }
        }
        .navigationTitle("歷史訂單")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu")
                                .padding(.bottom,10),
                            trailing: HeaderButton(show: $isShow.cart, iconImage: "cart",itemsInCartNum: itemsInCart.items.count)
                                .padding(.bottom,10)
                                .sheet(isPresented:$isShow.cart){
                                    CartView()
                                        .environmentObject(itemsInCart)
                                        .environmentObject(user)
                                })
        
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
            .environmentObject(Show())
            .environmentObject(ItemsInCart())
    }
}
