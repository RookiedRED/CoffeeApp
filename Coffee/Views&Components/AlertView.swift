//
//  AlertView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/10.
//

import SwiftUI

struct AlertView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var isShow : Show
    var connectView:String
    var isSuccessful:Bool
    let screenWidth = UIScreen.main.bounds.width
    var Alertname: String
    
    var body: some View {

            VStack {
                
                Text(Alertname)
                    .font(.system(size: screenWidth*0.096, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.01)
                    .foregroundColor(Color(#colorLiteral(red: 0.9215686275, green: 0.5098039216, blue: 0.02352941176, alpha: 1)))
                    .padding(.top,screenWidth/5)
                    .padding()
                Spacer()
                
                Button(action: {
                    
                    if self.isSuccessful{
                        self.presentationMode.wrappedValue.dismiss()
                        isShow.pages = connectView
                        
                    }
                    self.isShow.alert = false
     
                    
                }, label: {
                    Text("確認")
                        .font(.system(size: screenWidth*0.053, weight:.bold))
                        .foregroundColor(.white)
                        .padding(.vertical,5)
                        .padding(.horizontal,25)
                        .background(LinearGradient(gradient: Gradient(colors: [ Color(#colorLiteral(red: 0.9098039216, green: 0.2980392157, blue: 0.03921568627, alpha: 1)),Color(#colorLiteral(red: 0.9215686275, green: 0.5098039216, blue: 0.02352941176, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(screenWidth*0.133)
                        .overlay(RoundedRectangle(cornerRadius: screenWidth*0.133)
                                    .stroke(lineWidth: screenWidth/375)
                                    .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.4470588235, blue: 0.337254902, alpha: 1))))
                        .background(Rectangle()
                                        .fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                                        .cornerRadius(screenWidth*0.133)
                                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.22)), radius: 10, x: 0, y: 0).blur(radius: 3)
                                        .shadow(color: Color(#colorLiteral(red: 0.04705882353, green: 0.01960784314, blue: 0, alpha: 0.96)), radius: 6, x: 4, y: 4).blur(radius: 3)
                                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.12)), radius: 10, x: -2, y: -2).blur(radius: 3))
                        .padding()
                })
                Spacer()
            }
            .frame(width: screenWidth*0.76, height: screenWidth*0.693)
            .background(Color(.white))
            .cornerRadius(15)
            .shadow(radius: 10)
            .opacity(isShow.alert ? 1:0)
            .animation(.linear(duration: 0.5))
            

    

    }
    
}


struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(connectView: "首頁", isSuccessful: true, Alertname: "成功").environmentObject(Show())
    }
}
