//
//  Slideshow.swift
//  Coffee
//
//  Created by 林宏諭 on 2021/7/24.
//

import SwiftUI

struct Slideshow: View {
    private var numberOfImages = 5
    private let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    var body: some View {

            TabView(selection: $currentIndex){
                ForEach(0..<numberOfImages){num in
                    Image("Banner\(num)")
                        .resizable()
                        .scaledToFill()
                        .tag(num)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*2/5)
            .onReceive(timer, perform: { _ in
                //set the page to be next image
                
                currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
               
            })
        
        
    }
}

struct Slideshow_Previews: PreviewProvider {
    static var previews: some View {
        Slideshow()
    }
}
