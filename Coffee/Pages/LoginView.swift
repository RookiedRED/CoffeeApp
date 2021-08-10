//
//  LoginView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/9.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var isShow : Show
    @State private var username = ""
    @State private var password = ""
    @State var check = false
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            VStack(spacing: 12.0) {
                
                Image("logo")
                    .resizable()
                    .frame(width: screenWidth * 0.53, height: screenWidth * 0.66, alignment: .top)
                    .foregroundColor(.white)
                    .padding(.top,screenWidth * 0.1)
                
                //帳號輸入
                HStack(spacing:10) {
                    Text("帳號")
                        .font(.system(size: screenWidth * 0.05, weight: .bold))
                        .foregroundColor(.white)
                    TextField("username", text: $username)
                        .keyboardType(.emailAddress)
                        .font(.system(size: screenWidth * 0.06, weight: .regular))
                        .foregroundColor(.white)
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white)
                        )
                    
                }
                .padding(.horizontal,screenWidth/5.5)
                
                //密碼輸入
                HStack(spacing:10) {
                    Text("密碼")
                        .font(.system(size: screenWidth * 0.05, weight: .bold))
                        .foregroundColor(.white)
                    SecureField("password", text: $password)
                        .font(.system(size: screenWidth * 0.06, weight: .regular))
                        .foregroundColor(.white)
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white)
                        )
                    
                }
                .padding(.horizontal,screenWidth/5.5)
                
                
                //保持登入選項
                HStack {
                    checkBoxView(check: $check)
                    Text("保持登入")
                        .font(.system(size: screenWidth * 0.04, weight: .regular))
                        .foregroundColor(.white)
                }.padding()
                
                
                Button(action: {
                    //切換到主頁
                }){
                    Text("登入")
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
                }
                .padding()
                Button(action: {
                    //切換註冊頁面
                }) {
                    Text("註冊")
                        .font(.system(size: screenWidth*0.04, weight:.bold))
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()
                

                
                
            }
            .navigationTitle("登入")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10),trailing: HeaderButton(show: $isShow.cart, iconImage: "cart").padding(.bottom,10))
        }
    }
}


struct checkBoxView: View {
    @Binding var check: Bool
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        Image(systemName: check ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: screenWidth*0.04,height: screenWidth*0.04)
            .foregroundColor(check ? Color(.black) : Color.secondary)
            .background(Color(.white))
            .onTapGesture {
                self.check.toggle()
            }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(Show())
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            
    }
}
