//
//  HomeView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var bodyChosen: BodyPartSharedState
    
    var body: some View {
  
            ScrollView{
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    VStack{
                        PersonView()
                            
                            
                        
                        NavigationLink(destination: ChoosePartView()
                            //.navigationBarBackButtonHidden(true)
                            //.navigationBarItems(leading: backButton)
                        ){
                            Image("Circle_GoChosenBTN").resizable().frame(width:60,height: 60)
                            
                        }.offset(x:155,y:-45)
                        
                        SuggestClassCard()
                            .padding(.top, -25.0)
                        
                    }//stack end
                    .padding(.top, -15.0)
                    
                    
                    
                }
                
            }.accentColor(Color("Black_800"))
        
            
            
        
            

    }//body end
    
    var backButton: some View {
           Button(action: {
               // 返回按鈕的動作
               self.presentationMode.wrappedValue.dismiss()
           }) {
               Image(systemName: "chevron.left")
                   .foregroundColor(.blue)
                   .imageScale(.large)
                   .frame(width: 30, height: 30)
                   .contentShape(Rectangle())
           }
       }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       HomeView().environmentObject(BodyPartSharedState())
    }
}
