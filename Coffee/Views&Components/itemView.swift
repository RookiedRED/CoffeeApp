//
//  itemView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/30.
//

import SwiftUI

struct itemView: View {
    var item = Item(name: "none", price: 100, image: "ManuImage.mind", level: 0,type: "none")
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 8.0) {
                
                Image(item.image)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .cornerRadius(20)
                    .padding(.horizontal,10)
                    .padding(.top,10)
                
                HStack {
                    
                    Text(item.name)
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                    Spacer()
                }
                
                HStack(spacing: 0.0) {
                    if item.level >= 5 {
                        ForEach(0..<5){ _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 13, height: 13)
                                .foregroundColor(.white)
                        }
                    }
                    else{
                        ForEach(0..<item.level){ _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 13, height: 13)
                                .foregroundColor(.white)
                        }
                        ForEach(0..<5-item.level){ _ in
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 13, height: 13)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                    Text("NT$\(item.price)")
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal,10)
                .padding(.bottom,8)
                
            }.font(.system(size: 14, weight: .regular))
        }
        .frame(width: 0.43*UIScreen.main.bounds.width, height: 0.274*UIScreen.main.bounds.height)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
        .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

struct itemView_Previews: PreviewProvider {
    static var previews: some View {
        itemView()
    }
}
