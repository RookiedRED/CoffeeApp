//
//  NotificationView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/2.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text("[活動]咖啡日")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            HStack {
                Text("指定商品買一送一，詳情請至門市")
                    .font(.system(size: 14, weight: .medium))
                    .lineLimit(1)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .foregroundColor(.white)
                Text("2021/06/30")
                    .font(.system(size: 14, weight: .regular))
                    .lineLimit(1)
                    .frame(maxWidth:75,alignment: .bottom)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding(16)
        .frame(width: UIScreen.main.bounds.width-32, height: 80,alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
        .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
