//
//  ChartValueViewDemo.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/21.
//

import SwiftUI

struct ChartValueViewDemo: View {
    @State private var count :Int = 1
    @State private var Photoname=""
    
    var body: some View {
        VStack{
            
            TabView(selection: $count){
                MayChart()
                    .tag(0)
                JuneChart()
                    .tag(1)
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: 400,height: 500)
                .cornerRadius(10)
            //.shadow(color:.gray,radius: 5,x: 2,y:2)
                //.position(x:195,y:150)
        }
    }
    
}

struct ChartValueViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ChartValueViewDemo()
    }
}
