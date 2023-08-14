//
//  PreparationView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/8/11.
//

import SwiftUI


struct PreparationView: View {
    
    @State var prepareState: Int = 0
    
    @State var startTutorial: Bool = false
    
    var body: some View {
        
        ZStack{
            
            ZStack{
                //bg image
                switch prepareState {
                case 0:
                    Image("step1")
                       
                        
                        
                case 1:
                    Image("step2")
                case 2:
                    Image("step3")
                case 3:
                    Text("")
                default:
                    Text("")
                }
                
            }
            
            VStack{
                HStack{
                    
                    Spacer()
                    if prepareState == 3{
                        
                        Button(action: {
                            if prepareState != 0{
                                prepareState -= 1
                            }
                        },label: {
                            Image("lastStep")
                        })
                        
                    }else{
                        Button(action: {
                            if prepareState != 0{
                                prepareState -= 1
                            }else{
                                //close then back to choose part view
                                
                            }
                        },label: {
                            Image("backB")
                        })
                    }
                }.padding(24.0)
                
                Spacer()
                
                HStack{
                    
                    //next step btn
                    Button{
                        withAnimation(.easeInOut(duration: 0.3)){
                            if prepareState == 3{
                                prepareState = 0
                            }else{
                                prepareState += 1
                            }
                        }
                    }label: {
                        switch prepareState {
                        case 0:
                            Image("nextPBtn")
                        case 1:
                            Image("nextPBtn")
                        case 2:
                            Image("startcountBtn")
                            
                        case 3://counts at case 3
                            Text("")
                            
                            
                        default:
                            Text("")
                        }
                        //.foregroundColor((Color("Black_800")))
                    }
                    
                    Spacer()
                    
                    
                    //step states 第n步
                    switch prepareState {
                    case 0:
                        Image("st1Btn")
                    case 1:
                        Image("st2Btn")
                    case 2:
                        Text("")
                    case 3:
                        ClockCountView(isTimeUp: $startTutorial).rotationEffect(.degrees(90))
                    default:
                        Text("")
                    }
                    
                    if startTutorial{
                        Text("start is true")
                    }else{
                        Text("false now")
                    }
                    
                    
                }.padding(24)
            }
            
        }.toolbar(.hidden, for: .tabBar)
            
        
            
           
        
    }
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationView()
    }
}
