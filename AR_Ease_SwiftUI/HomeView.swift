//
//  HomeView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    var body: some View {
  
            
        NavigationView{
            ScrollView{
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    VStack{
                        PersonView()
                        
                        NavigationLink(destination: ChoosePartView()){
                            Image("Circle_GoChosenBTN").resizable().frame(width:60,height: 60)
                                
                        }.offset(x:155,y:-45)
                        
                        
                        SuggestClassCard()
                            .padding(.top, -25.0)
                       
                    }//stack end
                    
                    
                    
                }
                
            }.accentColor(Color("Black_800"))
            
            
        }
            
                    
            
            
            

        
        
        
//body&struct end
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
