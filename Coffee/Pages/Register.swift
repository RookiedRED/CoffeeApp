//
//  Register.swift
//  coffee
//
//  Created by 陳相廷 on 2021/8/3.
//

import SwiftUI

struct Register: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var name = ""
    let ImageView = UIScreen.main.bounds.width
    @State var Choose = false
    @State var check = false
    @State var check2 = false
    
    var body: some View {
        
        ScrollView {
            ZStack {
                VStack {
                    TopPart()
                    MidiumPart(Choose: Choose, check: check, check2: check2)
                    Button(action: {
                        //註冊
                    }) {
                        Text("註冊")
                            .font(.system(size: ImageView*0.053, weight:.bold))
                                                    .foregroundColor(.white)
                                                    .padding(.vertical,5)
                                                    .padding(.horizontal,25)
                                                    .background(LinearGradient(gradient: Gradient(colors: [ Color(#colorLiteral(red: 0.9098039216, green: 0.2980392157, blue: 0.03921568627, alpha: 1)),Color(#colorLiteral(red: 0.9215686275, green: 0.5098039216, blue: 0.02352941176, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                                    .cornerRadius(ImageView*0.133)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: ImageView*0.133)
                                                            .stroke(lineWidth: ImageView/375)
                                                            .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.4470588235, blue: 0.337254902, alpha: 1)))
                                                    )
                                                    .background(Rectangle()
                                                                    .fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                                                                    .cornerRadius(ImageView*0.133)
                                                                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.22)), radius: 10, x: 0, y: 0).blur(radius: 3)
                                                                    .shadow(color: Color(#colorLiteral(red: 0.04705882353, green: 0.01960784314, blue: 0, alpha: 0.96)), radius: 6, x: 4, y: 4).blur(radius: 3)
                                                                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.12)), radius: 10, x: -2, y: -2).blur(radius: 3))
                    
                        
                    }
                }
            }
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3678437173, green: 0.2994093597, blue: 0.2702392936, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1))]), startPoint: .top, endPoint: .bottom))
    }
}


//Preview
struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

struct registerInputView: View {
    
    let FieldView = UIScreen.main.bounds.width
    var textName = ""
    var fieldName = ""
    @Binding var fieldValue: String
    
    var body: some View {
        HStack {
            Text(textName)
                .font(.system(size: FieldView * 0.05, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding()
            TextField( fieldName, text: $fieldValue )
                .font(.system(size: FieldView * 0.05, weight: .bold, design: .rounded))
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white))
                
        }
    }
}

//會員資料
struct TopPart: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var name = ""
    let ImageView = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            Text("會員資料")
                .font(.system(size: ImageView * 0.064, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding()
            registerInputView(textName: "名稱", fieldName: "", fieldValue: $name)
                .padding()
            registerInputView(textName: "電話", fieldName: "", fieldValue: $phoneNumber)
                .padding()
            registerInputView(textName: "帳號", fieldName: "", fieldValue: $username)
                .padding()
            registerInputView(textName: "密碼", fieldName: "", fieldValue: $password)
                .padding()
            Spacer()
            Rectangle()
                        .fill(Color(#colorLiteral(red: 0.2235294118, green: 0.1803921569, blue: 0.1529411765, alpha: 1)))
                        .frame(width: 350, height: 1)
                        .shadow(color:Color(#colorLiteral(red: 0.4352941176, green: 0.3764705882, blue: 0.3411764706, alpha: 1)), radius: 2 ,y:1)
                        .shadow(color:Color(#colorLiteral(red: 0.1254901961, green: 0.1215686275, blue: 0.1176470588, alpha: 0.5)), radius: 2 ,y:-1)
            Spacer()
            
        }
    }
}

//個人偏好
struct MidiumPart: View {
    
    @State private var SliderValue: CGFloat = 1
    let ImageView = UIScreen.main.bounds.width
    @State var Choose = false
    @State var check = false
    @State var check2 = false
    
    var body: some View {
        
        VStack {
            Text("個人偏好")
                .font(.system(size: ImageView * 0.064, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding()
            SliderPart(SliderTitle: "容量")
            HStack {
                Text("冷熱")
                    .font(.system(size: ImageView * 0.05, weight: .bold, design: .rounded))
                    .frame(width: 50)
                    .foregroundColor(.white)
                    .padding()
                Slider(value: $SliderValue, in: 1 ... 3, step: 1)
                    //.background(Capsule().fill(Color("orange2")))
                    .accentColor(Color("orange2"))
                    .padding()
            }
            SliderPart(SliderTitle: "甜度")
            ChooseYourMilk(Choose: $Choose)
            CheckBoxView1(check: $check)
            CheckBoxView2(check２: $check2)
            
        }
    }
}

//Custom Slider
struct SliderPart: View {
    
    @State private var SliderValue: CGFloat = 1
    let ImageView = UIScreen.main.bounds.width
    var SliderTitle: String
    
    
    var body: some View {
        HStack {
            Text(SliderTitle)
                .font(.system(size: ImageView * 0.05, weight: .bold, design: .rounded))
                .frame(width: 50)
                .foregroundColor(.white)
                .padding()
            Slider(value: $SliderValue, in: 1 ... 3, step: 1)
                //.background(Capsule().fill(Color("orange2")))
                .accentColor(Color("orange2"))
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .padding()
        }
    }
}

//Milk Part
struct ChooseYourMilk: View {
    
    let ImageView = UIScreen.main.bounds.width
    @Binding var Choose: Bool
    
    var body: some View {
        HStack {
            Text("牛奶")
                .frame(width: ImageView * 0.32, height: ImageView * 0.1)
                .background(Choose ? Color("orange1") : Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)))
                .foregroundColor(.white)
                .cornerRadius(15)
                .onTapGesture {
                    self.Choose.toggle()}
                .padding()
            Text("植物奶")
                .frame(width: ImageView * 0.32, height: ImageView * 0.1)
                .background(Choose ? Color(#colorLiteral(red: 0.1411764706, green: 0.1294117647, blue: 0.1176470588, alpha: 1)) : Color("orange1"))
                .foregroundColor(.white)
                .cornerRadius(15)
                .onTapGesture {
                    self.Choose.toggle()}
                .padding()
            
        }
            
    }
}

//隱私條款(未對齊)
struct CheckBoxView1: View {
    @Binding var check: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: check ? "checkmark.square.fill" : "square")
                    .foregroundColor(check ? Color(.black) : Color.secondary)
                    .background(Color(.white))
                    .onTapGesture {
                        self.check.toggle()}


                Text("隱私條款")
                    .font(.system(.body, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}

//用戶使用條款(未對齊)
struct CheckBoxView2: View {
    @Binding var check２: Bool
    var body: some View {
        HStack {
            Image(systemName: check２ ? "checkmark.square.fill" : "square")
                .foregroundColor(check２ ? Color(.black) : Color.secondary)
                .background(Color(.white))
                .onTapGesture {
                    self.check２.toggle()}
            Text("用戶使用條款")
                .font(.system(.body, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
                .padding()
        }.offset(x: 17)
    }
}


struct ExDivider2: View {
    var body: some View{

        Rectangle()
            .fill(Color(#colorLiteral(red: 0.2235294118, green: 0.1803921569, blue: 0.1529411765, alpha: 1)))
            .frame(width: 350, height: 1)
            .shadow(color:Color(#colorLiteral(red: 0.4352941176, green: 0.3764705882, blue: 0.3411764706, alpha: 1)), radius: 2 ,y:1)
            .shadow(color:Color(#colorLiteral(red: 0.1254901961, green: 0.1215686275, blue: 0.1176470588, alpha: 0.5)), radius: 2 ,y:-1)


    }
}

