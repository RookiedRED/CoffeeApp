//
//  HomeView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/22.
//

import SwiftUI
struct HomeView: View {
    
    @State private var isShowMenu = false
    @State var showCart = false
    @State var searchItem = ""
    
    init(){
        navBarInit()
    }
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 0.0) {
                    
                    SideBarAndHeader(showMenu: $isShowMenu, showCart: $showCart)
                    
                    Slideshow()
                    
                    SearchBar(searchItem: $searchItem)
                        .padding(.horizontal,68)
                        .padding(.vertical,18)
                    
                    Spacer()
                    MenuScroll()
                }
                .frame(maxWidth:.infinity,maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .blur(radius: isShowMenu||showCart ? 10:0)
                .animation(.easeInOut)
                .navigationTitle("首頁")
                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarItems(leading:HeaderButton(show: <#T##Binding<Bool>#>, iconImage: <#T##String#>))
                
            }
            
            SideMenuView(show:$isShowMenu)
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ExDivider:View {
    var body: some View{
        
        Rectangle()
            .fill(Color(#colorLiteral(red: 0.2235294118, green: 0.1803921569, blue: 0.1529411765, alpha: 1)))
            .frame(width: 0.8, height: 24)
            .shadow(color:Color(#colorLiteral(red: 0.4352941176, green: 0.3764705882, blue: 0.3411764706, alpha: 1)), radius: 2 ,y:1)
            .shadow(color:Color(#colorLiteral(red: 0.1254901961, green: 0.1215686275, blue: 0.1176470588, alpha: 0.5)), radius: 2 ,y:-1)
        
        
    }
}

struct SearchBar: View {
    @Binding var searchItem:String
    
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


struct MenuScroll: View {
    var introductions = MenuCategoryData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2.0) {
            Text("菜單分類")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading,10)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:20) {
                    ForEach(introductions) { item in
                        MenuView(item: item)
                    }
                }
                .padding(10)
                
                Spacer()
            }
        }
    }
}

struct MenuCategory : Identifiable {
    var id = UUID()
    var title : String
    var image : String
    
}

let MenuCategoryData = [
    MenuCategory(title: "熱門餐點", image: "MenuImage.hot"),
    MenuCategory(title: "全部餐點", image: "MenuImage.main"),
    MenuCategory(title: "心情點餐", image: "ManuImage.mind"),
    MenuCategory(title: "飲料", image: "MenuImage.drinks")
    
]

struct MenuView: View {
    
    var item = MenuCategory(title: "Fast", image: "MenuImage.hot")
    
    
    var body: some View {
        VStack{
            
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 115, maxHeight: 115)
                .cornerRadius(5)
            
            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            
        }
        .shadow(radius: 5)
    }
}
