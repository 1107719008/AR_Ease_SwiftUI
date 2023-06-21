//
//  ChartBarViewDemo.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/21.
//

import SwiftUI

struct ChartBarViewDemo: View {
    @State private var count :Int = 1
        @State private var Photoname=""
    
    var body: some View {
       //Image("mayChart")
        
        VStack{
                    
                    TabView(selection: $count){
                        MayCalendar()
                            .tag(0)
                       JuneCalendar()
                            .tag(1)
                       
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .frame(width: 400,height: 500)
                        .cornerRadius(10)
                        //.shadow(color:.gray,radius: 5,x: 2,y:2)
                        //.position(x:195,y:150)
                    
        //btn ui-----------------------------------------------
//                    HStack{
//                        Button("Left"){
//                            count-=1
//                        }.onChange(of: count){newCount in
//                            if count==(-1){
//                                count=2
//                            }else{}
//                        }.padding()
//
//                        Button("Right"){
//                            count+=1
//                        }.onChange(of: count){newCount in
//                            if count==3{
//                                count=0
//                            }else{}
//                        }.padding()
//
//                    }
                }
        
        
        
        
    }
}

struct ChartBarViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ChartBarViewDemo()
    }
}
