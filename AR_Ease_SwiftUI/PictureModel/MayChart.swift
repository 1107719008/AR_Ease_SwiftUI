//
//  MayChart.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/21.
//

import SwiftUI

struct MayChart: View {
    @State var isTouch: Bool = false
    var body: some View {
        ZStack{
            Image("mayChart")
            
            Button(action: {
                withAnimation(.easeInOut){
                    isTouch.toggle()
                    
                }
            }, label: {
                if isTouch{
                    ZStack{
                        Image("mayChart")
                        Image("topHigh").offset(x:70,y:-67)
                    }
                    }else{
                        Image("mayChart")
                }
                
            })
            
            
        }
    }
}

struct MayChart_Previews: PreviewProvider {
    static var previews: some View {
        MayChart()
    }
}
