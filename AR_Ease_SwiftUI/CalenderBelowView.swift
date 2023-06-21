//
//  CalenderBelowView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/17.
//

import SwiftUI

struct CalenderBelowView: View {
    var body: some View {
      
            
            ScrollView{
                HStack{
                    Spacer()
                    
                    Button{
                        
                    }label:{
                        Image("FilterIcon")
                            .padding(.trailing, 30.0)
                            .offset(y:30)
                    }
                }
                
                VStack(alignment: .leading){
                    Image("TimeSet1")
                    NavigationLink(destination: ActionListDemo()){
                        ZStack{
                            
                            Image("WaistRestCB")
                            Image("FinishCB").offset(x:160,y:-33)
                        }
                    }.navigationTitle("")
                    
                    
                }.padding(.bottom, 5.0)
                VStack(alignment: .leading){
                    
                    Image("TimeSet2")
                    
                    ZStack{
                        Image("FreedomCB")
                        Image("UnfinishCB").offset(x:150,y:-33)
                    }
                    
                }.padding(.bottom, 5.0)
                
                VStack(alignment: .leading){
                    Image("TimeSet2")
                    ZStack{
                        Image("FreedomCB")
                        Image("UnfinishCB").offset(x:150,y:-33)
                    }
                    
                }.padding(.bottom, 5.0)
                
                
                
            }
        
    }
}

struct CalenderBelowView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderBelowView()
    }
}


//btn ref
//Button(action: {
//
//    isChoseActionN1.toggle()
//    if isChoseActionN1 {
//        sum += 1
//        sumTime += 1
//    }else{
//        sum -= 1
//    }
//
//
//}, label: {
//    if isChoseActionN1{
//        Image("A2")
//
//    }else{
//        Image("A1")
//
//    }
//
//})
