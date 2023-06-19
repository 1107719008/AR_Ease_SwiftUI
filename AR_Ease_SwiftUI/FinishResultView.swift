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
            HStack{
                
                Button(action: {
                    
                    
                    
                }, label: {
                    Image("AddTo")
                    
                })
                Button(action: {
                    
                    
                    
                }, label: {
                    Image("again")
                    
                })
                Button(action: {
                    
                    self.presentation.wrappedValue.dismiss()
                    
                }, label: {
                    Image("BackToHome")
                    
                })
                
                
                
                
                
            }.offset(y:124)
            
        }.rotationEffect(Angle(degrees: 90))
            .offset(y:-15)
            
        
    }
}

struct FinishResultView_Previews: PreviewProvider {
    static var previews: some View {
        FinishResultView()
    }
}
