//
//  ChoosePartView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

struct ChoosePartView: View {
    
    @State private var isPresented = false
    
    
    init() {
        //Customize nav bar title size
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 28)!]
    }
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                   

                    Text("選擇想要的姿勢").font(.custom("GenSenRoundedTW-B", size:28))
                        .foregroundColor((Color("Black_800"))).padding(.leading, 32)
                    Spacer()
                }
                HStack{
                   
                
                   
                }
                NavigationLink(destination: TutorialView()){
                   
                ZStack{
                    
                   
                    Image("yellowGoBtnBig")
                    Text("開始")
                        .font(.custom("GenSenRoundedTW-B", size:16))
                        .foregroundColor(.white)
                }
                }
                
                    
            }.navigationBarBackButtonHidden(true)
            
        }
    }
}

struct ChoosePartView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePartView()
    }
}



//custom color
//.foregroundColor((Color("Black_800")))


//tester -- full screen model view
// Button("Isss!") {
//self.isPresented.toggle()
//}
//.fullScreenCover(isPresented : $isPresented){ TutorialView()
//
//}

