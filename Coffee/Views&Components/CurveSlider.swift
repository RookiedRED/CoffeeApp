//
//  CurveSlider.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/8/5.
//

import SwiftUI



struct CurveSlider: View {
    
    @State var screenWidth = UIScreen.main.bounds.width
    @Binding var progress: CGFloat
    @State var angle: CGFloat = 18
    @State var scale: CGFloat = 1.0
    let range:CGFloat = 36
    let strokeLineWidth:CGFloat = 10
    
    var body: some View {
        
        VStack {
            ZStack {
                
                //slider範圍
                Circle()
                    .trim(from: 0.75-range/360/2, to: 0.75+range/360/2)
                    .stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),style: StrokeStyle(lineWidth: strokeLineWidth/1.5, lineCap: .round))
                    .frame(width: screenWidth*2, height: screenWidth*2)
                
                
                //slider調整值顯示條
                Circle()
                    .trim(from: 0, to: progress/10)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8588235294, green: 0.2588235294, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0.9215686275, green: 0.5098039216, blue: 0.3764705882, alpha: 1))]), startPoint: .topLeading, endPoint: .bottom),style: StrokeStyle(lineWidth: strokeLineWidth/1, lineCap: .round, lineJoin: .round))
                    .frame(width: screenWidth*2, height: screenWidth*2)
                    .rotationEffect(Angle(degrees: -90-Double(range)/2))
                
                
                //slider按鈕
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.1137254902, green: 0.04705882353, blue: 0, alpha: 1))]), startPoint: UnitPoint(x: 0.5-progress/2, y: 0), endPoint: .bottomLeading))
                    .frame(width: strokeLineWidth*3, height: strokeLineWidth*3)
                    .shadow(color: Color(#colorLiteral(red: 0.4784313725, green: 0.1725490196, blue: 0, alpha: 0.5)), radius: 3, x: -2, y: 2)
                    .overlay(Circle()
                                .stroke(Color(#colorLiteral(red: 0.3360350728, green: 0.303331852, blue: 0.2847372293, alpha: 1)),lineWidth: 0.5)
                                .shadow(color: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 3, x: 2, y: 0)
                    )
                    .scaleEffect(scale)
                    .offset(x: screenWidth)
                    .rotationEffect(Angle(degrees: Double(angle)))
                    .gesture(
                        DragGesture()
                                .onChanged{value in onDrag(value:value,range: range)}
                                .onEnded({ _ in
                                    withAnimation{
                                        scale = 1
                                    }
                                }))
                    .rotationEffect(Angle(degrees:-90-Double(range)/2))
//                Text("\(Int(progress*100))")
//                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                    .offset(y:-screenWidth+50)
            }
        }
        .frame(width: screenWidth,height: screenWidth/8)
        .offset(y:screenWidth)

    }
    
    func onDrag(value: DragGesture.Value,range:CGFloat) {
        let vector = CGVector(dx:value.location.x,dy: value.location.y)
        let radians = atan2(vector.dy, vector.dx)
        var angle = radians * 180 / .pi
        if angle <= 0{
            angle = 0
        }else if angle >= range {
            angle = range
        }
        withAnimation(.linear(duration: 0.15)){
            let progress = angle/36
            
            //震動效果
            let progressInt = Int(progress*10000)
            if progressInt%10 == 0 && progressInt > 0 && progressInt/10 < 100 {
                impact(style: .light)
            }
            
            self.progress = progress
            self.angle = CGFloat(angle)
            self.scale = 1.4
        }
        
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }

}
struct CurveSliderTest: View {
    @State var progress : CGFloat = 0.5
    @State var angle:CGFloat = 18
    var body: some View{
        
        CurveSlider(progress: $progress,angle:angle)
    }
}


struct CurveSlider_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CurveSliderTest()
        }
        
    }
}

