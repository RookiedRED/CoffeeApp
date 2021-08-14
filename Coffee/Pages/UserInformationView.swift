//
//  UserInformationView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/13.
//

import SwiftUI
import Firebase

struct UserInformationView: View {
    @EnvironmentObject var isShow: Show
    @EnvironmentObject var user: UserStore
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State var userName = " "
    @State var userPhoneNumber = ""
    @State var userEmail = ""
    let db = Firestore.firestore()

    
    func loadUserInformation(){
        db.collection("Users").document(user.email).getDocument{ (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                self.userEmail = document.documentID
                self.userName = document.data()!["name"] as! String
                self.userPhoneNumber = document.data()!["phoneNumber"] as! String
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    var body: some View {
        
        VStack(spacing: 24.0) {
            Text(userName)
                .font(.system(size: screenWidth * 0.08, weight: .bold))
                .foregroundColor(.white)
            ExDivider2()
            VStack(alignment: .leading, spacing: 12.0){
                Text("基本資料")
                    .font(.system(size: screenWidth * 0.06, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical,8)
                HStack {
                    Text("電話")
                        .font(.system(size: screenWidth * 0.06, weight: .regular))
                        .frame(width:screenWidth * 0.2,alignment: .leading)
                        .foregroundColor(.white)
                    Text(userPhoneNumber)
                        .font(.system(size: screenWidth * 0.06, weight: .regular))
                        .foregroundColor(.white)
                    
                }
                HStack {
                    Text("帳號")
                        .font(.system(size: screenWidth * 0.06, weight: .regular))
                        .frame(width:screenWidth * 0.2,alignment: .leading)
                        .foregroundColor(.white)
                    Text(userEmail)
                        .font(.system(size: screenWidth * 0.06, weight: .regular))
                        .foregroundColor(.white)
                    
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,60)
            ExDivider2()
            
            Spacer()
            Button(action: {
                loadUserInformation()
            }) {
                Text("修改會員資料")
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
            
            
                
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .padding(.vertical,60)
        .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10),trailing: HeaderButton(show: $isShow.cart, iconImage: "cart").padding(.bottom,10))
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            loadUserInformation()
        })

    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView()
            .environmentObject(Show())
            .environmentObject(UserStore())
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .navigationTitle("會員")
    }
}
