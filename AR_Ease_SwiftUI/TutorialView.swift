//
//  TutorialView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

import AVFoundation





struct TutorialView: View {
    
    //for full screen func
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isTimeUp = false
    @State private var isTimeAlmostUp = false
    
    @State private var isPrepareTimeUp = false
    
    @State private var isLocked = false
    
    //for fixing orentation problem
    @State private var isReadyLandscape = false
    @State private var orientation = UIDevice.current.orientation
    
    //alert
    @State private var rotateAlertShow = false
    @State private var showAlert = false
    
    var body: some View {
        
        ZStack{
            
            //alert 轉向橫的
            if !rotateAlertShow {
                Text("").alert(isPresented: $showAlert) {
                    Alert(title: Text("請旋轉螢幕至橫向")
                        .font(.custom("GenSenRoundedTW-B", size:24))
                        //.foregroundColor((Color("Black_700")))
                          //,message: Text("請旋轉螢幕至橫向").foregroundColor((Color("Black_800")))
                    )
                }.onDisappear(){
                    rotateAlertShow = true
                }
            }else{
                
            }
            
            
            
            if isPrepareTimeUp {
                
                if isTimeUp{
                    GameFinishView().navigationBarHidden(true).edgesIgnoringSafeArea(.all)
                }else{
                    ZStack{
                        ViewControllerCameraView()
                            .edgesIgnoringSafeArea(.all)
                            .navigationBarBackButtonHidden(true)
                        
                        HStack{
                            
                            VStack(alignment: .leading){
                                
                                
                                    Button(action: {
                                        
                                    }, label: {
                                        //Image("backIcon").rotationEffect(.degrees(90)).padding(30)
                                        
                                        ZStack{
                                            //Image("backWhite")
                                            Image("Bbtn")
                                            if isTimeAlmostUp {
                                                Text("戰士二式")//.rotationEffect(.degrees(90))
                                                    .font(.custom("GenSenRoundedTW-B", size: 24))
                                                    .foregroundColor((Color("Black_800"))).offset(x:5)
                                            }else{
                                                Text("樹式")//.rotationEffect(.degrees(90))
                                                    .font(.custom("GenSenRoundedTW-B", size: 24))
                                                    .foregroundColor((Color("Black_800")))
                                            }
                                        }.padding(.top)
                                        
                                    })

                                Spacer()
                                Image("secondsUI").padding(.bottom, 20)//.rotationEffect(.degrees(90)).offset(x:-75)
                               
                                
                            }.ignoresSafeArea(.all).padding(.leading,25)
                            
//                            HStack{
//
//                                //Image("legCheck_tree").rotationEffect(.degrees(90)).offset(x:-30)
//                                //Image("handCheck_tree").rotationEffect(.degrees(90)).offset(x:40)
//                                Text("")
//
//                            }.frame(width: 400, height: 200)
                            Spacer()
                            
                            HStack{
                                
                                CountDownView(timeAlmostUp: $isTimeAlmostUp, isTimeUp: $isTimeUp).allowsHitTesting(false).padding(.vertical,-12)
                                    .navigationBarBackButtonHidden(true)
                                    //.frame(width: 200, height: 350)
                            }//.offset(y:75)
                            
                            //ver 1. prreview
                            //                        HStack{
                            //
                            //                            Image("action3").rotationEffect(.degrees(90))
                            //                            Image("action2").padding(-10).rotationEffect(.degrees(90))
                            //                            Image("action1").rotationEffect(.degrees(90))
                            //
                            //                        }
                            
                            
                        }
                        
                    }
                    .onTapGesture {
                        //presentationMode.wrappedValue.dismiss()
                    }
                    .toolbar(.hidden, for: .tabBar)
                    
                    
                }
                
            }else{//prepare view
                ZStack{
                    if isReadyLandscape{
                        ViewControllerCameraView()
                            .edgesIgnoringSafeArea(.all)
                            .navigationBarBackButtonHidden(true)
                    }

                    PreparationView(startTutorial: $isPrepareTimeUp,isViewLandscape: $isReadyLandscape).navigationBarHidden(true).edgesIgnoringSafeArea(.all)
                    
                }
                
            }
            
        }.onAppear{
            showAlert = true
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
