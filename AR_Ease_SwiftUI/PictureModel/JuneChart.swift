//
//  JuneChart.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/21.
//

import SwiftUI

struct JuneChart: View {
    @State var isTouch: Bool = false
    var body: some View {
        ZStack{
            Image("juneChart")
            
            Button(action: {
                withAnimation(.easeInOut){
                    isTouch.toggle()
                    
                }
            }, label: {
                if isTouch{
                    ZStack{
                        Image("juneChart")
                        Image("topHigh").offset(x:13,y:-40)
                    }
                    }else{
                        Image("juneChart")
                }
                
            })
            
            
        }
    }
}

struct JuneChart_Previews: PreviewProvider {
    static var previews: some View {
        JuneChart()
    }
}
