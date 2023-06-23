//
//  CheckUsingMood.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/24.
//

import SwiftUI

struct CheckUsingMood: View {
    
    @State private var mood: Int = 0
    
    //@Binding var notLoginMood: Bool
    @EnvironmentObject var isNotLogged: UserMood
    
    var body: some View {
        
        VStack{
            HStack{
                Text("想要達成什麼效果？").font(.custom("GenSenRoundedTW-B", size:28))
                    .foregroundColor((Color("Black_800"))).padding(.leading, 30)
                    
                
                Spacer()
            }.padding(.bottom,15)
                .padding(.top,9)
            
            Image("LogSubBG")
                .padding(.bottom,24)
            
            VStack(spacing:10){
                
                Button(action: {
                    mood = 1
                    
                }, label: {
                    if mood == 1{
                        Image("releaseBG")
                    }else{
                        Image("releaseBGUnclicked")
                    }
                })
                
                Button(action: {
                    mood = 2
                    
                }, label: {
                    if mood == 2{
                        Image("musleClicked")
                    }else{
                        Image("musle")
                    }
                    
                })
                
                Button(action: {
                    mood = 3
                    
                }, label: {
                    if mood == 3{
                        Image("exerciseClicked")
                    }else{
                        Image("exercise")
                    }
                })
                
               
                
                
            }.padding(.bottom,35)
            Button(action: {
                withAnimation(){
                    isNotLogged.isNotLoggedIn = true
                }
            }, label: {
                Image("ChooseMoodBtn")
            })
            
            
            
            
        }
    }
}


//struct CheckUsingMood_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckUsingMood()
//    }
//}
