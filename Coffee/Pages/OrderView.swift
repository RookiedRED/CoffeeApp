//
//  OrderView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/5.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.presentationMode) var presentionMode: Binding<PresentationMode>
    @EnvironmentObject var isShow : Show
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State var itemDetail : ItemDetail = ItemDetail(name: "拿鐵", price: 70, image: "ItemCoffee", ice: 0.7, sugar: 0.5, milk: 0.5, number: 1)
    @State var changeType : String = "甜度"
    @State var itemSize : String = "M"
    @State var itemNumber: String = "1"
    var body: some View {
        
        VStack() {
            
            Image(itemDetail.image)
                .resizable()
                .frame(width: screenWidth*0.65, height: screenWidth*0.55)
                .cornerRadius(15)
                .shadow(color: Color(#colorLiteral(red: 1, green: 0.558999002, blue: 0, alpha: 0.5)), radius: 10, y: 2)
                .padding(.top)
            
            ZStack{
                Text("\(Int(itemDetail.ice*100))%")
                    .opacity(changeType == "冰塊" ? 1:0.3)
                    .offset(y:changeType == "冰塊" ? 0 :90.0)
                Text("\(Int(itemDetail.sugar*100))%")
                    .opacity(changeType == "甜度" ? 1:0.3)
                    .offset(y:changeType == "甜度" ? 0 :90.0)
                Text("\(Int(itemDetail.milk*100))%")
                    .opacity(changeType == "牛奶" ? 1:0.3)
                    .offset(y:changeType == "牛奶" ? 0 :90.0)
                
            }
            .foregroundColor(Color(#colorLiteral(red: 0.9137254902, green: 0.4, blue: 0.03137254902, alpha: 1)))
            .font(.system(size: 30, weight: .bold))
            .padding(.top,screenHeight/30)
            .padding(.bottom,screenHeight/10)
            
            
            ZStack {
                
                //MARK: - 大小選擇
                ZStack(alignment:.top) {
                    Circle()
                        .frame(width: screenWidth*2, height: screenWidth*2)
                        .foregroundColor(.white)
                        .shadow(color: Color(#colorLiteral(red: 0.8196078431, green: 0.4431372549, blue: 0, alpha: 0.25)), radius: 10, y: -8)
                    
                    HStack(spacing:screenWidth/4){
                        
                        Text("S")
                            .font(.system(size: screenWidth*0.07, weight:itemSize == "S" ? .bold:.regular))
                            .foregroundColor(itemSize == "S" ? .orange:.black)
                            .scaleEffect(itemSize == "S" ? 1.4:1)
                            .onTapGesture {
                                withAnimation {
                                    self.itemSize = "S"
                                }
                                
                            }
                        Text("M")
                            .font(.system(size: screenWidth*0.07, weight: itemSize == "M" ? .bold:.regular))
                            .foregroundColor(itemSize == "M" ? .orange:.black)
                            .scaleEffect(itemSize == "M" ? 1.4:1)
                            .offset(y:-screenWidth*0.07/2)
                            .onTapGesture {
                                withAnimation {
                                    self.itemSize = "M"
                                }
                            }
                        
                        Text("L")
                            .font(.system(size: screenWidth*0.07, weight: itemSize == "L" ? .bold:.regular))
                            .foregroundColor(itemSize == "L" ? .orange:.black)
                            .scaleEffect(itemSize == "L" ? 1.4:1)
                            .onTapGesture {
                                withAnimation {
                                    self.itemSize = "L"
                                }
                            }
                    }
                    .offset(y:screenHeight/24)
                }
                .frame(width: screenWidth*2, height: screenWidth*2)
                .offset(y:screenHeight/3.4)
                
                //MARK: - 冰塊甜度牛奶選擇
                ZStack(alignment:.top) {
                    Circle()
                        .frame(width: screenWidth*2, height: screenWidth*2)
                        .foregroundColor(.white)
                        .shadow(color: Color(#colorLiteral(red: 0.8196078431, green: 0.4431372549, blue: 0, alpha: 0.25)), radius: 10, y: -8)
                    
                    HStack(alignment:.center,spacing:screenWidth/8){
                        
                        Text("冰塊")
                            .font(.system(size: screenWidth*0.07, weight:changeType == "冰塊" ? .bold:.regular))
                            .foregroundColor(changeType == "冰塊" ? .orange:.black)
                            .scaleEffect(changeType == "冰塊" ? 1.4:1)
                            .onTapGesture {
                                withAnimation{
                                    self.changeType = "冰塊"
                                }
                            }
                        
                        Text("甜度")
                            .font(.system(size: screenWidth*0.07, weight:changeType == "甜度" ? .bold:.regular))
                            .foregroundColor(changeType == "甜度" ? .orange:.black)
                            .scaleEffect(changeType == "甜度" ? 1.4:1)
                            .offset(y:-screenWidth*0.07/2)
                            .onTapGesture {
                                withAnimation {
                                    self.changeType = "甜度"
                                }
                            }
                        
                        Text("牛奶")
                            .font(.system(size: screenWidth*0.07, weight:changeType == "牛奶" ? .bold:.regular))
                            .foregroundColor(changeType == "牛奶" ? .orange:.black)
                            .scaleEffect(changeType == "牛奶" ? 1.4:1)
                            .onTapGesture {
                                withAnimation {
                                    self.changeType = "牛奶"
                                }
                            }
                    }
                    .offset(y:screenHeight/20)
                    
                    
                    ZStack{
                        switch changeType {
                        
                        case "冰塊" : CurveSlider(progress:$itemDetail.ice, angle:CGFloat(itemDetail.ice*36) )
                            
                        case "甜度" : CurveSlider(progress:$itemDetail.sugar, angle:CGFloat(itemDetail.sugar*36) )
                            
                        case "牛奶" : CurveSlider(progress:$itemDetail.milk, angle:CGFloat(itemDetail.milk*36) )
                            
                        default:
                            CurveSlider(progress:$itemDetail.ice, angle:CGFloat(itemDetail.ice*36) )
                            
                        }
                    }
                    .offset(y:screenHeight/10)
                    .animation(.none)
                    
                    
                    
                }
                .frame(width: screenWidth*2, height: screenWidth*2)
                .offset(y:screenHeight/2.6)
                
                //MARK: - 加入購物車
                ZStack(alignment:.top) {
                    Circle()
                        .frame(width: screenWidth*2, height: screenWidth*2)
                        .foregroundColor(.white)
                        .shadow(color: Color(#colorLiteral(red: 0.8196078431, green: 0.4431372549, blue: 0, alpha: 0.25)), radius: 10, y: -8)
                    
                    VStack(spacing: 25.0){
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("加入購物車")
                                .font(.system(size: screenWidth*0.053, weight:.bold))
                                .foregroundColor(.white)
                                .padding(.vertical,5)
                                .padding(.horizontal,25)
                                .background(LinearGradient(gradient: Gradient(colors: [ Color(#colorLiteral(red: 0.9098039216, green: 0.2980392157, blue: 0.03921568627, alpha: 1)),Color(#colorLiteral(red: 0.9215686275, green: 0.5098039216, blue: 0.02352941176, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(screenWidth*0.133)
                                .overlay(
                                    RoundedRectangle(cornerRadius: screenWidth*0.133)
                                        .stroke(lineWidth: screenWidth/375)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.4470588235, blue: 0.337254902, alpha: 1)))
                                )
                                .background(Rectangle()
                                                .fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                                                .cornerRadius(screenWidth*0.133)
                                                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.22)), radius: 10, x: 0, y: 0).blur(radius: 3)
                                                .shadow(color: Color(#colorLiteral(red: 0.04705882353, green: 0.01960784314, blue: 0, alpha: 0.96)), radius: 6, x: 4, y: 4).blur(radius: 3)
                                                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.12)), radius: 10, x: -2, y: -2).blur(radius: 3))
                                
                        })
                        
                    }
                    .offset(y:screenHeight/16)
                }
                .frame(width: screenWidth*2, height: screenWidth*2)
                .offset(y:screenHeight/1.75)
                
                
            }
            .frame(width: screenWidth, height: screenHeight/3)
            .offset(y: -screenHeight/16)
            
            
        }
        .frame( maxWidth: .infinity,maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
        .navigationTitle(itemDetail.name)
        .navigationBarItems(leading:BackButton(backTitle:"菜單")
                                .padding(.bottom,10),trailing:HeaderButton(show: $isShow.cart, iconImage: "cart").padding(.bottom,10))
        .navigationBarBackButtonHidden(true)
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0.0) {
            OrderView().environmentObject(Show())
        }
    }
}
