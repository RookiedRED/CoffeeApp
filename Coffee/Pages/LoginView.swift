//
//  LoginView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/9.
//

import SwiftUI
import Firebase


struct LoginView: View {
    @EnvironmentObject var isShow: Show
    @EnvironmentObject var user: UserStore
    @State private var email:String = ""
    @State private var password:String = ""
    @State var keepLoggingCheck:Bool = false
    @State var isFocused:Bool = false
    @State var alertMessage:String = "Something went wrong."
    @State var showAlert:Bool = false
    
    
    let db = Firestore.firestore()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    //登入func
    func login(){
        self.hideKeyboard()
        self.isFocused = false
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let e = error {
                self.alertMessage = e.localizedDescription
                self.showAlert = true
                
            }else{
                self.user.keepLogging = true
                self.user.email = self.email
                loadUserInformation()
                
                self.isShow.pages = "首頁"
            }
            
        }
    }
    
    //載入用戶資料
    func loadUserInformation(){
        db.collection("Users").document(user.email).getDocument{ (document, error) in
            if let document = document, document.exists {
                self.user.name = document.data()!["name"] as! String
                self.user.phoneNumber = document.data()!["phoneNumber"] as! String
                if self.keepLoggingCheck {
                    UserDefaults.standard.setValue(true, forKey: "keepLogging")
                    UserDefaults.standard.setValue(self.email, forKey: "email")
                    UserDefaults.standard.setValue(self.user.name, forKey: "name")
                    UserDefaults.standard.setValue(self.user.phoneNumber, forKey: "phoneNumber")
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    //隱藏鍵盤
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
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
                    TextField("username", text: $email)
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
                    CheckBoxView(check: $keepLoggingCheck,checkString: "保持登入")
                    
                }.padding()
                
                
                //登入按鈕
                Button(action: {
                    login()
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
                
                //註冊按鈕
                NavigationLink(
                    destination: SignUpView(),
                    label: {
                        Text("註冊")
                            .font(.system(size: screenWidth*0.04, weight:.bold))
                            .foregroundColor(.white)
                            .padding()
                    })
                
                Spacer()
                
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .onTapGesture{
                hideKeyboard()
            }
            .navigationTitle("登入")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10),trailing: EmptyView())
            .alert(isPresented: $showAlert) { () -> Alert in
                return Alert(title: Text(""), message: Text(alertMessage), dismissButton: .destructive(Text("OK"),action:{self.isShow.cart.toggle()}))
            }
    }
}


struct CheckBoxView: View {
    let screenWidth = UIScreen.main.bounds.width
    @Binding var check: Bool
    let checkString:String
    var body: some View {
        HStack {
            Image(systemName: check ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: screenWidth*0.04,height: screenWidth*0.04)
                .foregroundColor(check ? Color(.black) : Color.secondary)
                .background(Color(.white))
                .onTapGesture {
                    self.check.toggle()
            }
            Text(checkString)
                .font(.system(size: screenWidth * 0.05, weight: .regular))
                .foregroundColor(.white)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(Show())
            .environmentObject(UserStore())
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            
    }
}
