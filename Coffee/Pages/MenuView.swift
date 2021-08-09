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
    @State var isShowSortSetting = false
    var title = "none"
    @State var items = itemsData
    let itemsAll:[Item]


    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                
                SearchBar(isShowSortSetting:$isShowSortSetting, searchItem: $searchItem,items: $items ,itemsAll:itemsAll)
                    .padding(.horizontal,68)
                    .padding(.vertical,18)
                
                ScrollView(.vertical,showsIndicators:false) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 12, content: {
                        ForEach(items){i in
                            NavigationLink(
                                destination: OrderView(itemDetail:ItemDetail(name: i.name, price: i.price, image: i.image, ice: 0.5, sugar: 0.5, milk: 0.5, number: 1)).environmentObject(Show())
                                ,
                                label: {
                                    itemView(item: i)
                                })
                           
                        }
                    })
                    
                }
                .padding(.horizontal,20)
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .blur(radius: isShowSortSetting || isShow.cart ? 8:0)
            .animation(.easeInOut)
            .navigationTitle(title)
            .navigationBarItems(leading:BackButton(backTitle:"首頁")
                                    .padding(.bottom,10),trailing:HeaderButton(show: $isShow.cart, iconImage: "cart").padding(.bottom,10))
            .navigationBarBackButtonHidden(true)
            
            SortSettingView(isShow: $isShowSortSetting, items: $items,itemsOringin: itemsAll)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MenuMain_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(itemsAll: itemsData).environmentObject(Show())
    }
}


struct SearchBar: View {
    @Binding var isShowSortSetting:Bool
    @Binding var searchItem:String
    @Binding var items:[Item]
    var itemsAll:[Item]
    var body: some View {

            HStack(alignment: .center){
                
                
                Button(action: {
                        self.isShowSortSetting.toggle()
                    
                }, label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(Color("iconGray"))
                })
                
                HStack(spacing: 0.0) {
                    
                    TextField("Search Here", text: $searchItem)
                        .onChange(of: searchItem, perform: { value in
                            if value == "" {
                                self.items = itemsAll
                            }
                        })
                    
                    ExDivider()
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding(7)
                        .foregroundColor(Color("iconGray"))
                        .onTapGesture {
                            self.items = search(items:itemsAll,searchText: searchItem)
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
