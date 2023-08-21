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
                    Text("詳細時間").font(.custom("GenSenRoundedTW-B", size:17))
                        .foregroundColor((Color("Black_800")))
                    Spacer()
                    
                    Button{
                        
                    }label:{
                        Image("FilterIcon")
                            
                           
                    }
                }.padding(.all, 16.0)
                
                VStack(alignment: .leading){
                    //Image("TimeSet1")
                    Text("今天 17:00").font(.custom("GenSenRoundedTW-B", size:15))
                        .foregroundColor((Color("Gray656565")))
                    NavigationLink(destination: ActionListDemo()){
                        ZStack{
                            
                            Image("WaistRestCB")
                            //Image("FinishCB").offset(x:160,y:-33)
                        }
                    }.navigationTitle("")
                    
                    
                }.padding(.bottom, 3.0)
                VStack(alignment: .leading){
                    
                    //Image("TimeSet2")
                    Text("今天 19:00").font(.custom("GenSenRoundedTW-B", size:15))
                        .foregroundColor((Color("Gray656565")))
                    
                    ZStack{
                        Image("FreedomCB")
                        //Image("UnfinishCB").offset(x:150,y:-33)
                    }
                    
                }.padding(.bottom, 3.0)
                
                VStack(alignment: .leading){
                    //Image("TimeSet2")
                    Text("今天 20:00").font(.custom("GenSenRoundedTW-B", size:15))
                        .foregroundColor((Color("Gray656565")))
                    
                    ZStack{
                        Image("FreedomCB")
                        //Image("UnfinishCB").offset(x:150,y:-33)
                    }
                    
                }.padding(.bottom, 3.0)
                
                
                
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
