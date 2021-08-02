//
//  MenuMain.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/28.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.presentationMode) var presentionMode: Binding<PresentationMode>
    @EnvironmentObject var isShow : Show
    @State var searchItem = ""
    
    var title = "none"
    @State var items = itemsData
    
    var body: some View {
        VStack(spacing: 0.0) {
            
            SearchBar2(searchItem: $searchItem,items: $items)
                .padding(.horizontal,68)
                .padding(.vertical,18)
            
            ScrollView(.vertical,showsIndicators:false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 12, content: {
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
        .navigationBarItems(leading:BackButton()
                                .padding(.bottom,10),trailing:HeaderButton(show: $isShow.menu, iconImage: "cart").padding(.bottom,10))
        .navigationBarBackButtonHidden(true)
    }
}

struct MenuMain_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(Show())
    }
}


struct SearchBar2: View {
    @Binding var searchItem:String
    @Binding var items:[Item]
    var body: some View {
        HStack(alignment: .center){
            Image("filter")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(Color("iconGray"))
            HStack(spacing: 0.0) {
                
                TextField("Search Here", text: $searchItem)
                
                Divider()
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .padding(.vertical,6)
                ExDivider()
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .padding(7)
                    .foregroundColor(Color("iconGray"))
                    .onTapGesture {
                        self.items = search(searchText: searchItem)
                    }
                
                
                
            }.font(.subheadline)
            .padding(.leading)
            .frame(height: 36)
            .background(ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 0.15)))
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.clear,lineWidth: 3)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)), radius: 3, x: 1, y: 1)
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.clear,lineWidth: 2)
                    .shadow(color: Color(#colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 0.25)), radius: 3, x: -2, y: -1)
                
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(#colorLiteral(red: 0.08235294118, green: 0.0862745098, blue: 0.09019607843, alpha: 1)),lineWidth: 1)
                
            })
            .cornerRadius(5)
        }
    }
}
