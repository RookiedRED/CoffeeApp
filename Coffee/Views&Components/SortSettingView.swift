//
//  SortSettingView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/4.
//

import SwiftUI

struct sortView: View {
    @State var items = itemsData
    @State var isShow = true
    var body: some View {
        SortSettingView(isShow:$isShow,items: $items,itemsOringin: itemsData)
    }
    
}

struct SortSettingView: View {
    let screenWidth = UIScreen.main.bounds.width
    @Binding var isShow:Bool
    @Binding var items:[Item]
    let itemsOringin:[Item]
    @State var sortType = ""
    @State var sortOrder = false
    var types = ["無","價格","評價分數"]
    var body: some View {
        ZStack {
            GeometryReader{_ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(isShow ? 1:0)
            .animation(.easeInOut)
            .onTapGesture {
                self.isShow.toggle()
            }
            
            VStack(spacing: 0.0){
                
                //排序方法選擇
                Picker(selection: $sortType, label: Text("排序方式") ){
                    ForEach(types.indices){ option in
                        Text(types[option]).tag(types[option])
                            .font(.system(size: UIScreen.main.bounds.width*0.07, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
                .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
                .padding()
                
                //排序順序切換
                Toggle(isOn: $sortOrder, label: {
                    Text("由高至低")
                        .font(.system(size:UIScreen.main.bounds.width*0.064 , weight: .regular))
                        .foregroundColor(.white)
                })
                .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.9215686275, green: 0.5098039216, blue: 0.02352941176, alpha: 1))))
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
                .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
                .padding()
                
                
                Button(action: {
                    if sortType == "無" {
                        self.items = self.itemsOringin
                    }else{
                        self.items = sort(items: items, type: sortType, order: sortOrder)
                    }
                    
                    self.isShow.toggle()
                }, label: {
                    
                    //排序確認按鈕
                    Text("確認")
                        .font(.system(size: UIScreen.main.bounds.width*0.064))
                        .foregroundColor(.black)
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
                .padding()
                .padding(.vertical,25)
                
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3006534576, green: 0.2713910937, blue: 0.2547548711, alpha: 1)), Color(#colorLiteral(red: 0.1970462501, green: 0.08181617409, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .offset(y:UIScreen.main.bounds.height/5)
            .offset(y: isShow ? 0:UIScreen.main.bounds.height)
            .animation(.easeInOut)
            
        }
        
    }
}

struct SortSettingView_Previews: PreviewProvider {
    static var previews: some View {
        sortView()
    }
}


