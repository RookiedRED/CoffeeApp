//
//  MenuMain.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/28.
//

import SwiftUI

struct MenuView: View {
    
    
    @EnvironmentObject var isShow : Show
    @State var searchItem = ""
    
    var title = "none"
    var items = itemsData
    
    var body: some View {
        VStack(spacing: 0.0) {
            
            SearchBar(searchItem: $searchItem)
                .padding(.horizontal,68)
                .padding(.vertical,18)
            
            ScrollView(.vertical,showsIndicators:false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12, content: {
                    ForEach(items){i in
                       itemView(item: i)
                    }
                })
                
            }
            .padding(.horizontal,20)

            
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .blur(radius: isShow.menu ? 10:0)
        .animation(.easeInOut)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10))
        .navigationBarBackButtonHidden(true)
    }
}

struct MenuMain_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(Show())
    }
}
