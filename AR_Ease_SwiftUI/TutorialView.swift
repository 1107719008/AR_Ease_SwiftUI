//
//  TutorialView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI




struct TutorialView: View {
    var body: some View {
        ZStack{
            ViewControllerCameraView().ignoresSafeArea()

            VStack{
                
                HStack{
                    
                    Image("secondsUI").rotationEffect(.degrees(90)).offset(x:-50)
                    Spacer()
                    VStack{
                        Button(action: {
                            
                        }, label: {
                            Image("backIcon").rotationEffect(.degrees(90)).padding(30)
                            
                        })
                        Text("樹式").rotationEffect(.degrees(90))
                            .font(.custom("GenSenRoundedTW-B", size: 24))
                            .foregroundColor(Color.black)
                        
                    }.offset(y:-80)
                    
                    
                }.frame(width: .infinity, height: 230)
                HStack{
                   
                    Image("legCheck_tree").rotationEffect(.degrees(90)).offset(x:-30)
                    Image("handCheck_tree").rotationEffect(.degrees(90)).offset(x:40)
                    
                }.frame(width: 400, height: 200)
                Spacer()
                HStack{
                    Spacer()
                    CountDownView().rotationEffect(.degrees(90)) .allowsHitTesting(false)
                        .frame(width: 130, height: 120)
                }
                
                HStack{
                    
                    Image("action3").rotationEffect(.degrees(90))
                    Image("action2").padding(-10).rotationEffect(.degrees(90))
                    Image("action1").rotationEffect(.degrees(90))
                    
                }
                
                
            }
            
            
            
            
        }
    }
    
    
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}


//rotation
//.rotationEffect(.degrees(90))

//fonts
//GenSenRounded TW
//--GenSenRoundedTW-R
//--GenSenRoundedTW-M
//--GenSenRoundedTW-B

//get font code below
//init(){
//    for familyName in UIFont.familyNames{
//        print(familyName)
//        for fontName in UIFont.fontNames(forFamilyName: familyName){
//            print("--\(fontName)")
//        }
//    }
//}
