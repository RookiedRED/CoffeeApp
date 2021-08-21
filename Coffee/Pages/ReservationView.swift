//
//  ReservationView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/20.
//

import SwiftUI
import Network
import FirebaseFirestoreSwift
import Firebase
struct ReservationView: View {
    
    @EnvironmentObject var isShow : Show
    @EnvironmentObject var itemsInCart: ItemsInCart
    @EnvironmentObject var user: UserStore
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State private var bookingDate = Date()
    @State private var people = 1
    @State var showAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    func reservationSend(){
        let db = Firestore.firestore()
        var errorInWritting = false
        let nowDate:String = getNowDate()
        let monitor = NWPathMonitor()
        
        
        //網路檢查開始
        monitor.start(queue: DispatchQueue.global())
        monitor.pathUpdateHandler = { path in
            
            if path.status == .satisfied { //網路確認連線
                let dateFormatter: DateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yy-MM-dd HH:mm:ss"
                dateFormatter.locale = Locale(identifier: "zh_Hant_TW") // 設定地區(台灣)
                dateFormatter.timeZone = TimeZone(identifier: "Asia/Taipei") // 設定時區(台灣)
                let dateFormatString:String = dateFormatter.string(from: self.bookingDate)
                
                let data = reservationData(date: dateFormatString, people: self.people)
                do {
                    try db.collection("Reservations").document("\(nowDate)-\(user.email)").setData(from: data)
                    
                }catch let error{
                    errorInWritting = true
                    print("Error writing data to Firestore: \(error)")
                }
                
                if errorInWritting {
                    self.alertTitle = "預約無效"
                    self.alertMessage = "送出訂位時發生未預期錯誤"
                    self.showAlert = true
                    
                }else{
                    DispatchQueue.main.async {
                        self.itemsInCart.items.removeAll()
                    }
                    self.alertTitle = "訂位成功"
                    self.alertMessage = "訂位時間:\(dateFormatString)\n人數:\(people)位"
                    self.showAlert = true
                }

            } else { //無網路連線
                self.alertTitle = "訂位無效"
                self.alertMessage = "請檢察網路狀況"
                self.showAlert = true
            }
        }
        //網路檢查結束
        monitor.cancel()
        
    }
    
    var body: some View {
        VStack(spacing: 20){
            DatePicker("預約日期", selection: $bookingDate,in:Date()...)
                .background(ZStack {
                    RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5)
                })
                .datePickerStyle(GraphicalDatePickerStyle())
                .accentColor(Color(#colorLiteral(red: 0.9026349783, green: 0.3080496192, blue: 0.06296164542, alpha: 1)))
                .environment(\.colorScheme, .dark)
                .frame(height: screenHeight/2)
                .padding(.horizontal)
            
            Picker(selection: $people, label: Text("人數") ){
                ForEach(1..<5){ number in
                    Text("\(number)").tag(number)
                    .font(.system(size: UIScreen.main.bounds.width*0.07, weight: .bold))
                    .foregroundColor(.white)
                }
            }
            .frame(height: 100)
            .clipped()
            .background(ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 1)), Color(#colorLiteral(red: 0.4396114945, green: 0.4213786721, blue: 0.4089385867, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                Text("人")
                    .font(.system(size: UIScreen.main.bounds.width*0.06, weight: .bold))
                    .foregroundColor(.gray)
                    .offset(x:UIScreen.main.bounds.width*0.1)
            })
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.407158196, green: 0.3964286149, blue: 0.399425149, alpha: 1)), Color(#colorLiteral(red: 0.1942529082, green: 0.1198880151, blue: 0.04169399291, alpha: 0.4))]), startPoint: .topLeading, endPoint: .bottomTrailing ), lineWidth: 1.5))
            .shadow(color: Color(#colorLiteral(red: 0.1215686275, green: 0.05882352941, blue: 0.003921568627, alpha: 0.59)), radius: 8, x: 4, y: 9)
            .padding(.horizontal)
            
            Button(action: {}, label: {
                Text("預約")
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
            .padding(40)
            
            Spacer()
        }
        .navigationTitle("訂位")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:HeaderButton(show: $isShow.menu, iconImage: "menu").padding(.bottom,10),trailing: EmptyView())
        .alert(isPresented: $showAlert) { () -> Alert in
            return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .destructive(Text("OK"),action:{self.isShow.cart.toggle()}))
        }
        
    
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
            .environmentObject(Show())
            .environmentObject(ItemsInCart())
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
    }
}
