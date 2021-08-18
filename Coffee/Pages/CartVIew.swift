//
//  CartView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/14.
//

import SwiftUI
import Firebase

struct CartView: View {
    @EnvironmentObject var itemsInCart: ItemsInCart
    @EnvironmentObject var user: UserStore
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State var takeDate = Date()
    @State var totalPrice:Int = 0
    
    let db = Firestore.firestore()
    //初始化List背景顏色
    init(){
        UITableView.appearance().backgroundColor = UIColor(red: 21/255,green: 22/255, blue: 23/255, alpha: 1)
    }
    
    //增加商品數量
    func plusNumber(item:ItemDetail){
        if let index = self.itemsInCart.items.firstIndex(where:{ $0.id == item.id}){
            self.totalPrice += self.itemsInCart.items[index].price
            self.itemsInCart.items[index].number += 1
            
        }
    }
    
    //減少商品數量
    func minusNumber(item:ItemDetail){
        if let index = self.itemsInCart.items.firstIndex(where:{ $0.id == item.id}){
            if self.itemsInCart.items[index].number == 1 {
                self.totalPrice -= self.itemsInCart.items[index].price
                self.itemsInCart.items.remove(at: index)
            }else{
                self.totalPrice -= self.itemsInCart.items[index].price
                self.itemsInCart.items[index].number -= 1
                
            }
        }
    }

//    
//    func transDataForSend(items:[ItemDetail])->[ItemDataSend]{
//        var dataForSend = [ItemDataSend]()
//        
//        for i in 0..<items.count {
//            let new = ItemDataSend(name: items[i].name, price: items[i].price, ice: items[i].ice, sugar: items[i].sugar, milk: items[i].milk, number: items[i].number)
//            dataForSend.append(new)
//        }
//        return dataForSend
//    }
//
//    func orderSend(){
//
//        db.collection("Orders").addDocument(data: ["user":user.email,
//                                                   "name":user.name,
//                                                   "phone":user.phoneNumber,
//                                                   "items":""
//        ])
//            .document(user.email).setData(["name":user.name,"phoneNumber":user.phoneNumber]){error in
//            if let e = error{
//                print(e.localizedDescription)
//            }
//
//        }
//    }
    
    var body: some View {
        
        VStack {
            //購物車中的商品
            List{
                ForEach(itemsInCart.items){ i in
                    
                    HStack {
                        Image(i.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(5)
                            .scaledToFill()
                        
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text(i.name)
                                .font(.system(size:screenWidth*0.06, weight: .bold))
                                .foregroundColor(.white)
                            Text("NT$ \(i.price)")
                                .font(.system(size:screenWidth*0.05, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: screenWidth/20){
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth/16)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    withAnimation {
                                        minusNumber(item: i)
                                    }
                                    
                                }
                            
                            
    
                            Text("\(i.number)")
                                .font(.system(size:screenWidth*0.08, weight: .bold))
                                .frame(width: screenWidth/10)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.3400139213, blue: 0.05600187927, alpha: 1)))
                            
                            
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth/16)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    withAnimation {
                                        plusNumber(item: i)
                                    }
                                }
                        }
                        
                    }
                    .contextMenu {
                        VStack{
                            Text("冰塊: \(i.ice*100, specifier: "%.0f")%")
                            Text("甜度: \(i.sugar*100, specifier: "%.0f")%")
                            Text("牛奶: \(i.milk*100, specifier: "%.0f")%")
                        }.multilineTextAlignment(.trailing)
                    }
                    .listRowBackground(
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.2371205091, green: 0.2174595296, blue: 0.1987408698, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            Rectangle().stroke()
                        })
                }
                .onDelete{ index in
                    self.itemsInCart.items.remove(atOffsets: index)
                }
            }
            .frame(height:screenHeight*0.6)
            
            //取餐日期選擇
            DateChoose(takeDate:$takeDate)
                .padding(.vertical,20)
            
            
            //總價顯示
            HStack {
                Text("總計")
                    .font(.system(size:screenWidth*0.06, weight: .bold))
                    .foregroundColor(.gray)
                Spacer()
                Text("NT$ \(totalPrice)")
                    .font(.system(size:screenWidth*0.06, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.horizontal,10)
            
            
            //送出按鈕
            Button(action: {
//                orderSend()
            }) {
                Text("送出")
                    .font(.system(size: screenWidth*0.06, weight:.bold))
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
                
                
            }
            .padding()
            
            Spacer()
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.bottom)
        .onAppear{
            for i in itemsInCart.items {
                self.totalPrice += i.price
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ItemsInCart())
            .environmentObject(UserStore())
    }
}

struct DateChoose: View {
    @Binding var takeDate:Date
    
    var body: some View {
        DatePicker("選擇取餐時間", selection: $takeDate)
            .accentColor(Color(#colorLiteral(red: 0.9026349783, green: 0.3080496192, blue: 0.06296164542, alpha: 1)))
            .foregroundColor(.white)
            .padding(16)
            .frame(width: UIScreen.main.bounds.width-32,alignment: .leading)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.3113900423, green: 0.3008462191, blue: 0.2918944359, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
            .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

