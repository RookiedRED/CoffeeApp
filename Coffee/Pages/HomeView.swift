//
//  HomeView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/22.
//

import SwiftUI
struct HomeView: View {
    @EnvironmentObject var isShow : Show
    @State var searchItem = ""
    var items = itemsData
    
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            
            Slideshow()
            
            SearchBarToNewView(searchItem: $searchItem, items:items)
                .padding(.horizontal,68)
                .padding(.vertical,screenHeight/25)
            
            MenuScroll()
        }
        
        
        .navigationTitle("首頁")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10),trailing: HeaderButton(show: $isShow.cart, iconImage: "cart").padding(.bottom,10))
        

        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView().environmentObject(Show())
    }
}

struct ExDivider:View {
    var body: some View{
        
        Rectangle()
            .fill(Color(#colorLiteral(red: 0.2235294118, green: 0.1803921569, blue: 0.1529411765, alpha: 1)))
            .frame(width: 1, height: 24)
            .shadow(color:Color(#colorLiteral(red: 0.4352941176, green: 0.3764705882, blue: 0.3411764706, alpha: 1)), radius: 2 ,y:1)
            .shadow(color:Color(#colorLiteral(red: 0.1254901961, green: 0.1215686275, blue: 0.1176470588, alpha: 0.5)), radius: 2 ,y:-1)
        
        
    }
}

struct SearchBarToNewView: View {
    @Binding var searchItem:String
    var items:[Item]
    var body: some View {
        HStack(alignment: .center){
            
            HStack(spacing: 0.0) {
                
                TextField("Search Here", text: $searchItem)
                
                
                ExDivider()
                
                
                NavigationLink(
                    destination: MenuView(title:searchItem,items:search(items:items,searchText: searchItem),itemsAll: search(items:items,searchText: searchItem)).environmentObject(Show()),
                    label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding(7)
                            .foregroundColor(Color("iconGray"))
                    })
                
                
            }
            .font(.subheadline)
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
        .padding(.leading,25)
    }
}


struct MenuScroll: View {
    
    let screenWidth = UIScreen.main.bounds.width
    var menus = menusData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2.0) {
            Text("菜單分類")
                .font(.system(size: UIScreen.main.bounds.width*0.064))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading,10*UIScreen.main.bounds.width/375)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:20) {
                    ForEach(menus) { item in
                        NavigationLink(
                            
                            destination: MenuView(title:item.title,items: menuSearch(type: item.type),itemsAll: menuSearch(type: item.type)).environmentObject(Show()),
                            
                            label: {
                                MenuCategory(item: item)
                            })
                    }
                }
                .padding(10*UIScreen.main.bounds.width/375)
                
                Spacer()
            }
        }
    }
}


struct MenuCategory: View {
    let screenWidth = UIScreen.main.bounds.width
    var item = Menu(title: "Fast", image: "MenuImage.hot",type:"Hot")
    
    
    var body: some View {
        VStack{
            
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth/3, height: screenWidth/3)
                .cornerRadius(5)
            
            Text(item.title)
                .font(.system(size: screenWidth*0.048, weight: .bold))
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            
        }
        .shadow(radius: 5)
    }
}
