//
//  SignUpView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/12.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var isShow: Show
    @State private var userDetail:UserModel = UserModel(name: "", phoneNumber: "", email: "", password: "")
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State var alertMessage:String = "Please Confirm Terms"
    @State var connectView:String = ""
    @State var isSuccessful:Bool = false
    @State var passwordConfirm = ""
    @State var check = false
    @State var check2 = false
    
    let db = Firestore.firestore()
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func signUp(){
        if (userDetail.name == "" || userDetail.phoneNumber == "") {
            self.alertMessage = "請輸入完整資訊"
            self.isShow.alert = true
            
        }else if  userDetail.password != passwordConfirm {
            self.alertMessage = "兩次密碼輸入需一致"
            self.isShow.alert = true
            
        }else if !(check && check2){
            self.alertMessage = "請確認接受所有條款"
            self.isShow.alert = true
            
        }else{
            Auth.auth().createUser(withEmail: userDetail.email, password: userDetail.password) { _, error in
                if let e = error {
                    self.alertMessage = e.localizedDescription
                    self.isShow.alert = true
                }else{
                    db.collection("Users").document(userDetail.email).setData(["name":userDetail.name,"phoneNumber":userDetail.phoneNumber]){error in
                        if let e = error{
                            print(e.localizedDescription)
                        }
                        
                    }
                    self.connectView = "會員"
                    self.alertMessage = "註冊成功"
                    self.isSuccessful = true
                    self.isShow.alert = true
                    
                }
            }
        }
        
    }
    
    var body: some View {
        
        ZStack {
            ScrollView {
                
                VStack {
                    
                    VStack(spacing: 36.0) {
                        Text("會員資料")
                            .font(.system(size: screenWidth * 0.08, weight: .bold))
                            .foregroundColor(.white)
                        
                        VStack(spacing: 36.0) {
                            HStack(spacing:12){
                                Text("名稱")
                                    .font(.system(size: screenWidth * 0.06, weight: .bold))
                                    .foregroundColor(.white)
                                TextField("", text: $userDetail.name )
                                    .foregroundColor(.white)
                                    .font(.system(size: screenWidth * 0.05, weight: .regular))
                                    .textFieldStyle(WhiteRoundedBorder())
                            }
                            
                            HStack(spacing:12){
                                Text("電話")
                                    .font(.system(size: screenWidth * 0.06, weight: .bold))
                                    .foregroundColor(.white)
                                TextField("", text: $userDetail.phoneNumber)
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.white)
                                    .font(.system(size: screenWidth * 0.05, weight: .regular))
                                    .textFieldStyle(WhiteRoundedBorder())
                            }
                            
                            HStack(spacing:12){
                                Text("帳號")
                                    .font(.system(size: screenWidth * 0.06, weight: .bold))
                                    .foregroundColor(.white)
                                TextField("", text: $userDetail.email)
                                    .keyboardType(.emailAddress)
                                    .foregroundColor(.white)
                                    .font(.system(size: screenWidth * 0.05, weight: .regular))
                                    .textFieldStyle(WhiteRoundedBorder())
                            }
                            
                            HStack(spacing:12){
                                Text("輸入密碼")
                                    .font(.system(size: screenWidth * 0.06, weight: .bold))
                                    .foregroundColor(.white)
                                SecureField("", text: $userDetail.password)
                                    .foregroundColor(.white)
                                    .font(.system(size: screenWidth * 0.05, weight: .regular))
                                    .textFieldStyle(WhiteRoundedBorder())
                            }
                            
                            HStack(spacing:12){
                                Text("確認密碼")
                                    .font(.system(size: screenWidth * 0.06, weight: .bold))
                                    .foregroundColor(.white)
                                SecureField("", text: $passwordConfirm)
                                    .foregroundColor(.white)
                                    .font(.system(size: screenWidth * 0.05, weight: .regular))
                                    .textFieldStyle(WhiteRoundedBorder())
                            }
                            
                        }.padding(.horizontal,screenWidth * 0.1)
                        
                    }
                    .padding(.vertical,screenHeight*0.05)
                    
                    ExDivider2()
                    
                    VStack(alignment: .leading, spacing: 18) {
                        CheckBoxView(check: $check,checkString: "隱私條款")
                        CheckBoxView(check: $check2,checkString: "用戶使用條款")
                    }
                    .padding()
                    
                    Button(action: {
                        signUp()
                    }) {
                        Text("註冊")
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
                
            }
            
            AlertView(connectView: connectView, isSuccessful: isSuccessful, Alertname: alertMessage)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .onTapGesture{
            hideKeyboard()
        }
        .navigationTitle("註冊")
        .navigationBarItems(leading:BackButton(backTitle:"登入")
                                .padding(.bottom,10))
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(Show())
    }
}


struct ExDivider2: View {
    var lineWidth:CGFloat = 350
    var lineHeight:CGFloat = 1
    var body: some View{
        
        Rectangle()
            .fill(Color(#colorLiteral(red: 0.2235294118, green: 0.1803921569, blue: 0.1529411765, alpha: 1)))
            .frame(width: lineWidth, height: lineHeight)
            .shadow(color:Color(#colorLiteral(red: 0.4352941176, green: 0.3764705882, blue: 0.3411764706, alpha: 1)), radius: 2 ,y:1)
            .shadow(color:Color(#colorLiteral(red: 0.1254901961, green: 0.1215686275, blue: 0.1176470588, alpha: 0.5)), radius: 2 ,y:-1)
        
        
    }
}


struct WhiteRoundedBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(8)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.white.opacity(0.05))
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.white)
                })
    }
}
