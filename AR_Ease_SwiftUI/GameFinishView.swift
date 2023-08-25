//
//  GameFinishView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/17.
//

import SwiftUI

struct GameFinishView: View {
    
    @State var isResultView = false
    
    var body: some View {
        ZStack{
            if isResultView{
                FinishResultView()
            } else {
//                ZStack{
//                    Image("WinBG").edgesIgnoringSafeArea(.all)
//                    VStack(spacing: 19){
//                        Image("WinCup")
//                        Text("你已經完成今日舒緩！")
//                            .font(.custom("GenSenRoundedTW-B", size:28))
//                            .foregroundColor(Color("Black_800"))
//                        HStack(spacing: 84){
//
//                            VStack(spacing: 5){
//                                Text("88%").font(.custom("GenSenRoundedTW-B", size:24))
//                                Text("符合度").font(.custom("GenSenRoundedTW-R", size:12))
//                            }
//                            VStack(spacing: 2){
//                                Text("10:00").font(.custom("GenSenRoundedTW-B", size:24))
//                                Text("時長").font(.custom("GenSenRoundedTW-R", size:12))
//
//                            }
//                        }.foregroundColor(Color("Blue_700"))
//
//                        HStack(spacing:16){
//
//
//                            Button{
//                                isResultView = true
//                            }label: {
//
//                                Image("goResult")
//                            }
//
//
//                        }
//                    }
//
//                }.rotationEffect(Angle(degrees: 90))
//                    .offset(y:-30)
                
                //new code 0822
                ZStack{
                    Image("gFinishView")
                    
                    HStack{
                        Spacer()
                        Button{
                            isResultView = true
                        }label: {
                            
                            Image("NextWinBtn")
                        }.offset(x:-32,y:150)
                    }
                    
                }
                    
                
                
            }
        }.toolbar(.hidden, for: .tabBar)
        
    }
}

struct GameFinishView_Previews: PreviewProvider {
    static var previews: some View {
        GameFinishView()
    }
}


//fonts
//.font(.custom("GenSenRoundedTW-B", size:32))
//.foregroundColor(Color("Black_700"))

