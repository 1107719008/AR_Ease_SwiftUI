//
//  PersonView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

struct PersonView: View {
    
    @State private var isSelectedNeck = false
    @State private var isSelectedShoulder = false
    @State private var isSelectedWaist = false
    @State private var isSelectedBack = false
    @State private var isSelectedCalf = false
    
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            HStack{
                
                VStack{
                    Text("舒緩一下吧～")
                        .font(.custom("GenSenRoundedTW-B", size:32))
                        .foregroundColor(Color("Black_700"))
                        .padding(.bottom, 0.0)
                        .offset(x:-18,y:0)
                    
                    
                    Image("HIwithBG")
                    
                }
                
                VStack{
                    Button(action: {
                        isSelectedNeck.toggle()
                    }, label: {
                        if isSelectedNeck{
                            Image("NeckFilled")
                             
                        }else{
                            Image("NeckOutline")
                               
                        }
                    }
                    ).offset(x:-275).frame(width: 0.0, height: 60.0)
                    
                    Button(action: {
                        isSelectedShoulder.toggle()
                    }, label: {
                        if isSelectedShoulder{
                            Image("ShoulderFilled")
                            
                        }else{
                            Image("ShoulderOutline")
                            }
                        
                    }).offset(x:-310).frame(width: 0.0, height: 60.0)
                    
                    Button(action: {
                        isSelectedWaist.toggle()
                    }, label: {
                        if isSelectedWaist{
                            Image("WaistFilled")
                        }else{
                            Image("WaistOutline")
                        }
                        
                    }).offset(x:-325).frame(width: 0.0, height: 60.0)
                    
                    Button(action: {
                        isSelectedBack.toggle()
                    }, label: {
                        if isSelectedBack{
                            Image("BackFilled")
                        }else{
                            Image("BackOutline")
                        }
                        
                    }).offset(x:-320).frame(width: 0.0, height: 70.0)
                    
                    Button(action: {
                      
                            isSelectedCalf.toggle()
                       
                    }, label: {
                        if isSelectedCalf{
                            Image("CalfFilled")
                               
                        }else{
                            Image("CalfOutline")
                                
                        }
                        
                    }).offset(x:-290).frame(width: 0.0, height: 70.0)
                        
                    
                    
                }
                .padding(.top, 50.0)//btn vstack
                
                
                
            }
            
            
        }.offset(x:35)
        
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
