//
//  PreparationView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/8/11.
//

import SwiftUI


struct PreparationView: View {
    
    @State var prepareState: Int = 0
    
    @Binding var startTutorial: Bool
    @Binding var isViewLandscape: Bool
    
   
    
    var body: some View {
        
        ZStack{
            
            ZStack{
                //bg image
                switch prepareState {
                case 0:
                    Image("step1_1")
                       
                        
                        
                case 1:
                    Image("step2_1")
                case 2:
                    Image("step3_1")
                case 3:
                    Spacer()
                default:
                    Text("")
                }
                
            }
            
            HStack{
                
                VStack{
                    
                   
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
                    
                    Spacer()
                    
                }.padding([.top, .leading], 24.0)
                    
                
                Spacer()
                
                VStack{
                    
                    //step states 第n步
                    switch prepareState {
                    case 0:
                        Image("st1Btn")
                    case 1:
                        Image("st2Btn")
                    case 2:
                        Text("")
                        
                    case 3:
                        ClockCountView(isTimeUp: $startTutorial)
                        
                    default:
                        Text("")
                    }
                    
                    
                    Spacer()
                    
                    //next step btn
                    Button{
                        withAnimation(.easeInOut(duration: 0.3)){
                            if prepareState == 3{
                                prepareState = 0
                            }else{
                                
                                if prepareState == 2{
                                    isViewLandscape = true
                                }
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
                    
                    
                    
                    
                }.padding(.horizontal,24)
                    .padding(.vertical, 18)
            }.padding(.trailing)
            
        }.toolbar(.hidden, for: .tabBar)
            //.frame(width: 392,height: 852)
            
        
            
           
        
    }
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationView(startTutorial: .constant(false), isViewLandscape: .constant(false))
    }
}
