//
//  Cardviews.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/2.
//

import SwiftUI

struct CardView_Notification: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text("[活動]咖啡日")
                .font(.system(size: screenWidth*0.0533, weight: .bold))
                .foregroundColor(.white)
            HStack {
                Text("指定商品買一送一，詳情請至門市")
                    .font(.system(size: screenWidth*0.0373, weight: .medium))
                    .lineLimit(1)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .foregroundColor(.white)
                Text("2021/06/30")
                    .font(.system(size: screenWidth*0.0373, weight: .regular))
                    .lineLimit(1)
                    .frame(alignment: .trailing)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width-32,alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
        .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

struct CardView_OrderHistory: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack(alignment: .top) {
                Text("2020/07/04")
                    .font(.system(size: screenWidth*0.048, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 0.9176470588, green: 0.462745098, blue: 0.02352941176, alpha: 1)))
                Spacer()
                Text("#0255484847")
                    .font(.system(size: screenWidth*0.0373, weight: .regular))
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Text("美式咖啡、拿鐵、咖啡")
                .font(.system(size: screenWidth*0.048, weight: .medium))
                .lineLimit(1)
                .frame(maxWidth:.infinity,alignment: .leading)
                .foregroundColor(.white.opacity(0.8))
            
            
            HStack(alignment:.bottom) {
                Text("$60")
                    .font(.system(size: screenWidth*0.048, weight: .medium))
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .foregroundColor(.white)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("查看明細")
                        .font(.system(size: screenWidth*0.048, weight: .bold))
                        .lineLimit(1)
                        .frame(maxWidth:.infinity,alignment: .bottom)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 50)
                                    .stroke(lineWidth: screenWidth/375)
                                    .foregroundColor(.white))
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("重新下訂")
                        .font(.system(size: screenWidth*0.048, weight: .black))
                        .lineLimit(1)
                        .frame(maxWidth:.infinity,alignment: .bottom)
                        .foregroundColor(Color(#colorLiteral(red: 0.9176470588, green: 0.462745098, blue: 0.02352941176, alpha: 1)))
                        .overlay(RoundedRectangle(cornerRadius: 50)
                                    .stroke(lineWidth: screenWidth/375)
                                    .foregroundColor(Color(#colorLiteral(red: 0.9176470588, green: 0.462745098, blue: 0.02352941176, alpha: 1))))
                })
                
                
            }
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width-32,alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
        .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

struct CardView_BookingHistory: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16.0) {
                Text("2020/07/04")
                    .font(.system(size: screenWidth*0.064, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 0.9176470588, green: 0.462745098, blue: 0.02352941176, alpha: 1)))
                Text("16:00 ~ 18:00")
                    .font(.system(size: screenWidth*0.048, weight: .medium))
                    .foregroundColor(.white)
                
            }.frame(maxWidth:.infinity,alignment: .leading)
            
            Text("人數：2")
                .font(.system(size: screenWidth*0.064, weight: .medium))
                .frame(maxWidth:.infinity,alignment: .center)
                .foregroundColor(.white)
            
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width-32,alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
        .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

struct CardView_Knowledge: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack(spacing:16){
            Image("MenuImage.main")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth*0.293, height: screenWidth*0.293)
                .cornerRadius(15)
            
            VStack(spacing:10) {
                Text("咖啡小知識-7")
                    .font(.system(size: screenWidth*0.053, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .foregroundColor(.white)
                Text("咖啡知識是一門很深的學問，從咖啡品種、處理法和烘焙程度到沖煮方法，都有很多技術成面，因此blank")
                    .font(.system(size: screenWidth*0.0373, weight: .regular))
                    .lineLimit(3)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .foregroundColor(.white)
                Text("2021/06/30")
                    .font(.system(size: screenWidth*0.0373, weight: .regular))
                    .lineLimit(4)
                    .frame(maxWidth:.infinity,alignment: .trailing)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width-32,alignment:.leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
        .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

struct CardView_Event: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack(spacing:16){
            Image("ManuImage.mind")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth*0.293, height: screenWidth*0.293)
                .cornerRadius(15)
            
            VStack(spacing:10) {
                Text("咖啡一日體驗")
                    .font(.system(size: screenWidth*0.064, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth:.infinity,alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 0.9176470588, green: 0.462745098, blue: 0.02352941176, alpha: 1)))
                HStack {
                    Text("2021/07/24")
                        .font(.system(size: screenWidth*0.048, weight: .regular))
                        .foregroundColor(.white)
                    
                    Text("截止")
                        .font(.system(size: screenWidth*0.048, weight: .bold))
                        .foregroundColor(.red)
                }
                .frame(alignment:.center)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("我要報名")
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
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width-32,alignment:.leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
        .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

struct CardViews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView_Notification()
            CardView_OrderHistory()
            CardView_BookingHistory()
            CardView_Knowledge()
            CardView_Event()
        }
        
    }
}
