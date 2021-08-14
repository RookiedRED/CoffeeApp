//
//  Slideshow.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/24.
//

import SwiftUI

struct Slideshow: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    private var numberOfImages = 5
    private let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    @State var currentIndex = 0
    
    var body: some View {

            TabView(selection: $currentIndex){
                ForEach(0..<numberOfImages){ num in
                    Image("Banner\(num)")
                        .resizable()
                        .scaledToFit()
                        .tag(num)
                        
                }
            }
            .background(Color.white.opacity(0.5))
            .tabViewStyle(PageTabViewStyle())
            .frame(width: screenWidth, height: screenHeight/3)
            .onReceive(timer, perform: { _ in
                //set the page to be next image
                withAnimation {
                    currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
                }
            })
        
        
        
    }
}

struct Slideshow_Previews: PreviewProvider {
    static var previews: some View {
        Slideshow()
    }
}
