//
//  BeforeHomeView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/24.
//

import SwiftUI

struct CheckLoginMoodView: View {
    
    //@Binding var toggleHomePage: Bool
    @State var notLoginMood: Bool = false
    //@EnvironmentObject var isNotLogged: UserMood
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                Image("easelogo")
                
                Spacer()
               
                VStack(spacing: 10){
                    Image("LoginBtn")
                    Image("registerBtn")
                    
                    NavigationLink(destination: CheckUsingMood()){
                        
                        Image("DontLog")
                        
                    }.navigationTitle("")
                        .navigationBarBackButtonHidden(true)
                        .foregroundColor(Color("Black_700"))
                   
                    
                }
                .padding(.bottom,50)
                
                
            }
            
        }
        
        
        
    }
}

//struct CheckLoginMoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckLoginMoodView()
//    }
//}
