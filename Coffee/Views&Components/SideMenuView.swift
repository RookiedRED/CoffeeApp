//
//  SideMenuView.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/28.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var isShow : Show
    @EnvironmentObject var user: UserStore
    @Binding var show : Bool
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        ZStack{
            
            //BorderSpaceBack
            Color(isShow.menu ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.01):#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0))
                .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0,maxHeight: .infinity)
                .onTapGesture {
                    self.isShow.menu.toggle()
                }
            
            //MenuOptions
            VStack(alignment: .leading, spacing:screenHeight/22) {
                
                ForEach(SideMenuViewModel.allCases,id:\.self){ option in
                    
                    Button(action: {
                        if option.title == "登出" {
                            self.user.keepLogging = false
                            UserDefaults.standard.setValue(false, forKey: "keepLogging")
                            self.user.email = ""
                            UserDefaults.standard.setValue("", forKey: "email")
                            self.user.name = ""
                            UserDefaults.standard.setValue("", forKey: "name")
                            self.user.phoneNumber = ""
                            UserDefaults.standard.setValue("", forKey: "phoneNumber")
                        }
                        self.isShow.pages = option.title
                        self.isShow.menu = false
                    }, label: {
                        SideMenuOption(viewModel: option)
                    })
                    
                }
                Spacer()
                
            }
            .padding(.top,45)
            .padding(.leading, screenWidth/6)
            .frame(minWidth:0,maxWidth:screenWidth/1.2 )
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.9))
            .cornerRadius(20)
            .padding(.trailing,60)
            .shadow(color:Color(#colorLiteral(red: 0.5176470588, green: 0.3176470588, blue: 0.01568627451, alpha: 0.88)), radius: 10, x:8,y:20 )
            .animation(.easeInOut)
            .offset(x: isShow.menu ? -screenWidth/15:-screenWidth)
            
            
        }
        
    }
    
}


struct SideMenuOption: View {
    
    let viewModel:SideMenuViewModel
    
    var body: some View {
        HStack(spacing:10){
            //icon
            Image(systemName: viewModel.imgageName)
                .imageScale(.large)
                .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                .frame(width: 32, height: 32)
            //name
            Text(viewModel.title)
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                .font(.system(size: 20.0, weight: .regular))
            
            Spacer()
        }
    }
    
}
