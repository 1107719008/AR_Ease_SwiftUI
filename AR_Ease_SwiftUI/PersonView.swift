//
//  PersonView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

struct PersonView: View {
    
    
    
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
            HStack{
                
                VStack{
                    Text("舒緩一下吧～")
                        .font(.custom("GenSenRoundedTW-B", size:32))
                        .foregroundColor(Color("Black_800"))
                        .padding(.bottom, 0.0)
                        .offset(x:-30,y:-15)
                    
                    
                    Image("HIwithBG")
                    
                }
                
                VStack{
                    Button(action: {
                        
                    }, label: {
                        Image("NeckOutline").padding(12.5)
                            .offset(x:-275)
                        
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image("ShoulderOutline").padding(12.5)
                            .offset(x:-335)
                        
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image("WaistOutline").padding(12.5)
                            .offset(x:-360)
                        
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image("BackOutline").padding(12.5)
                            .offset(x:-355)
                        
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image("CalfOutline").padding(12.5)
                            .offset(x:-325)
                        
                    })
                    
                    
                }
                
                
            }
            
            
        }.offset(x:83)
        
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
