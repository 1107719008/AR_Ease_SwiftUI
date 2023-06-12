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
                VStack{
                    PersonView()
                    
                    NavigationLink(destination: ChoosePartView()){
                        Image("Circle_GoChosenBTN").resizable().frame(width:60,height: 60)
                    }
                    
                }//stack end
                
                
            }.toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        
                    }, label: {
                        Text("L Icon")//.position(x:30,y:10)
                        
                    })}
//                ToolbarItem(placement: .principal) {
//                    Text("Ease 小意思")
//                        .font(.custom("GenSenRoundedTW-B", size:28))
//                        .foregroundColor(.black)
//                        //.offset(y:30)
//
//                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        
                    }, label: {
                        Text("R Icon")//.position(x:15,y:10)
                        
                        
                    })
                }
            }
        }.accentColor(Color("Black_800"))
            
                    
            
            
            

        
        
        
//body&struct end
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
