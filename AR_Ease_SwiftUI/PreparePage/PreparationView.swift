//
//  PreparationView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/8/11.
//

import SwiftUI


struct PreparationView: View {
    
    @State var prepareState: Int = 0
    
    var body: some View {
        
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
            
            VStack{
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
                    case 3:
                        Text("")
                    default:
                        Text("")
                    }
                    //.foregroundColor((Color("Black_800")))
                }
                
               
                
                //step states 第n步
                switch prepareState {
                case 0:
                    Image("st1Btn")
                case 1:
                    Image("st2Btn")
                case 2:
                    Text("")
                case 3:
                    Text("")
                default:
                    Text("")
                }
            }
            
            
        }.rotationEffect(.degrees(90))
        
    }
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationView()
    }
}
