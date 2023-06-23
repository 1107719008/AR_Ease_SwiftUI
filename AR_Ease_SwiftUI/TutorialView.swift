//
//  TutorialView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI




struct TutorialView: View {
    //for full screen func
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isTimeUp = false
    
    var body: some View {
        
        ZStack{
            if isTimeUp{
                GameFinishView().navigationBarHidden(true).edgesIgnoringSafeArea(.all)
            }else{
                ZStack{
                    ViewControllerCameraView()
                        .edgesIgnoringSafeArea(.all).offset(x:3)
                    
                    VStack{
                        
                        HStack{
                            
                            Image("secondsUI").rotationEffect(.degrees(90)).offset(x:-50)
                            Spacer()
                            VStack{
                                Button(action: {
                                    
                                }, label: {
                                    Image("backIcon").rotationEffect(.degrees(90)).padding(30)
                                    
                                })
                                Text("牛式").rotationEffect(.degrees(90))
                                    .font(.custom("GenSenRoundedTW-B", size: 24))
                                    .foregroundColor((Color("Black_800")))
                                
                            }.offset(y:-80)
                            
                            
                        }.offset(y:35)
                        
                        HStack{
                            
                            //Image("legCheck_tree").rotationEffect(.degrees(90)).offset(x:-30)
                            //Image("handCheck_tree").rotationEffect(.degrees(90)).offset(x:40)
                            Text("")
                            
                        }.frame(width: 400, height: 200)
                        Spacer()
                        
                        HStack{
                            
                            CountDownView(isTimeUp: $isTimeUp).allowsHitTesting(false)
                                .frame(width: 200, height: 350).rotationEffect(.degrees(90))
                        }.offset(y:75)
                        
                        //ver 1. prreview
//                        HStack{
//
//                            Image("action3").rotationEffect(.degrees(90))
//                            Image("action2").padding(-10).rotationEffect(.degrees(90))
//                            Image("action1").rotationEffect(.degrees(90))
//
//                        }
                        
                        
                    }.navigationBarHidden(true)
                    
                }
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
                .toolbar(.hidden, for: .tabBar)
                
                
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
