//
//  SideBarAndHeader.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/22.
//

import SwiftUI
struct testView:View {
    @State var showMenu = false
    @State var showCart = false
    var body: some View{
        ZStack {
            VStack {
                HStack{
                    
                    HeaderButton(show:$showMenu, iconImage: "menu")//Menu
                        .onTapGesture {
                            self.showMenu.toggle()
                        }
                    BackButton(backTitle:"首頁")
                    Spacer()
                    
                    Text("首頁")
                        .font(.system(size:24, weight: .black))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HeaderButton(show:$showCart, iconImage: "cart")//Sopping-Cart
                        .onTapGesture {
                            self.showCart.toggle()
                        }
                }
                Spacer()
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .blur(radius: showMenu||showCart ? 10:0)
            .animation(.easeInOut)
            
            
        }
    }
}


struct SideBarAndHeader_Previews: PreviewProvider {
    static var previews: some View {
        
        testView()
    }
}


struct BackButton:View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let backTitle: String
    var body: some View {
        ZStack {

            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack(spacing:0){
                    Image("back")
                        .resizable()
                        .foregroundColor(Color("iconGray"))
                        .frame(width: 15, height: 20)
                    Text(backTitle)
                        .foregroundColor(Color("iconGray"))
                }
            })
            .padding(.horizontal,3)
            .frame(width: 60, height: 35, alignment: .leading)
            .background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2, green: 0.1803921569, blue: 0.168627451, alpha: 1)), Color(#colorLiteral(red: 0.1137254902, green: 0.04705882353, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                    Rectangle()//inner right-bottom shadow
                        .stroke(Color.clear,lineWidth: 5)
                        .shadow(color: Color(.black).opacity(0.2), radius: 5, x: -3, y: -3)
                    
                    Rectangle()//inner left-top light
                        .stroke(Color.clear,lineWidth: 5)
                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.1), radius: 5, x: 3, y: 3)
                })
            .cornerRadius(10)
            
            //Button stoke
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1294117647, green: 0.1176470588, blue: 0.003921568627, alpha: 1)), Color(#colorLiteral(red: 0.1529411765, green: 0.1137254902, blue: 0.0862745098, alpha: 0.59))]), startPoint: .topLeading, endPoint: .bottomTrailing )))
            
            //Button backshadow
            .shadow(color: Color(#colorLiteral(red: 0.7725490196, green: 0.7607843137, blue: 0.7607843137, alpha: 0.12)), radius: 4, x: 0.0, y: 0.0)
            .shadow(color: Color(#colorLiteral(red: 0.02745098039, green: 0.01568627451, blue: 0, alpha: 0.4250843199)), radius: 1, x: 2, y: 2)
        }
        
    }
}
struct HeaderButton: View {
    @Binding var show : Bool
    var iconImage:String
    var type:String? = "left"
    var body: some View {
        
        ZStack {
            
            Button(action: {
                self.show.toggle()
            }, label: {
                Image(iconImage)
                    .resizable()
                    .foregroundColor(Color("iconGray"))
                    .frame(width: 25, height: 25)
            })
            .frame(width: 60, height: 35, alignment: .center)
            .background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2, green: 0.1803921569, blue: 0.168627451, alpha: 1)), Color(#colorLiteral(red: 0.1137254902, green: 0.04705882353, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                    Rectangle()//inner right-bottom shadow
                        .stroke(Color.clear,lineWidth: 5)
                        .shadow(color: Color(.black).opacity(0.2), radius: 5, x: -3, y: -3)
                    
                    Rectangle()//inner left-top light
                        .stroke(Color.clear,lineWidth: 5)
                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.1), radius: 5, x: 3, y: 3)
                })
            .cornerRadius(10)
            
            //Button stoke
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1294117647, green: 0.1176470588, blue: 0.003921568627, alpha: 1)), Color(#colorLiteral(red: 0.1529411765, green: 0.1137254902, blue: 0.0862745098, alpha: 0.59))]), startPoint: .topLeading, endPoint: .bottomTrailing )))
            
            //Button backshadow
            .shadow(color: Color(#colorLiteral(red: 0.7725490196, green: 0.7607843137, blue: 0.7607843137, alpha: 0.12)), radius: 4, x: 0.0, y: 0.0)
            .shadow(color: Color(#colorLiteral(red: 0.02745098039, green: 0.01568627451, blue: 0, alpha: 0.4250843199)), radius: 1, x: 2, y: 2)
        }
    }
}



