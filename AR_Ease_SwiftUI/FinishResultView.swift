//
//  FinishResultView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/20.
//

import SwiftUI

struct FinishResultView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack{
            
            Image("finishResultDemo")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:-10){
                    Image("card2")
                    Image("card1")
                    Image("card3")
                    Image("card4")
                    Image("card5")
                }.frame(width: 1000)
                
            }
            HStack{
                Spacer()
                Button(action: {
                    
                    
                    
                }, label: {
                    Image("addTo")
                    
                })
                
                Spacer()
                
                Button(action: {
                    
                    
                    
                }, label: {
                    Image("againBtn")
                    
                })
                Button(action: {
                    
                    self.presentation.wrappedValue.dismiss()
                    
                }, label: {
                    Image("BackToHome")
                    
                })
                Spacer()
                
                
                
                
            }.offset(y:135)
            
        }.rotationEffect(Angle(degrees: 90))
            .offset(y:-25)
            
        
    }
}

struct FinishResultView_Previews: PreviewProvider {
    static var previews: some View {
        FinishResultView()
    }
}
