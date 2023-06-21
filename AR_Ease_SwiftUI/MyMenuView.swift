//
//  MyMenuView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/19.
//

import SwiftUI

struct MyMenuView: View {
    @State var a1: Bool = false
    @State var a2: Bool = false
    @State var a3: Bool = false
    @State var a4: Bool = false
    @State var a5: Bool = false
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                
                Text("我的菜單").font(.custom("GenSenRoundedTW-B", size:28))
                    .foregroundColor((Color("Black_800"))).padding(.leading, 30)
                Spacer()
                
                NavigationLink(destination:MyMenuSetUp() ){
 
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(Color("Black_700"))
                        .frame(width: 24,height: 24)
                        .padding(16)
        
                }.offset(y:-60)
                
                
            }
            
            VStack(spacing:10){
                Button(action: {
                    
                    a1.toggle()
                    //                if a1 {
                    //
                    //                }else{
                    //
                    //                }
                    
                }, label: {
                    if a1{
                        Image("mm1")
                        
                    }else{
                        Image("mm1")
                        
                    }
                    
                })
                Button(action: {
                    
                    a2.toggle()
                    //                if a1 {
                    //
                    //                }else{
                    //
                    //                }
                    
                }, label: {
                    if a2{
                        Image("mm2")
                        
                    }else{
                        Image("mm2")
                        
                    }
                    
                })
                Button(action: {
                    
                    a3.toggle()
                    //                if a1 {
                    //
                    //                }else{
                    //
                    //                }
                    
                }, label: {
                    if a3{
                        Image("mm3")
                        
                    }else{
                        Image("mm3no")
                        
                    }
                    
                })
                Button(action: {
                    
                    a4.toggle()
                    //                if a1 {
                    //
                    //                }else{
                    //
                    //                }
                    
                }, label: {
                    if a4{
                        Image("mm4")
                        
                    }else{
                        Image("mm4no")
                        
                    }
                    
                })
                Button(action: {
                    
                    a5.toggle()
                    //                if a1 {
                    //
                    //                }else{
                    //
                    //                }
                    
                }, label: {
                    if a5{
                        Image("mm5")
                        
                    }else{
                        Image("mm5no")
                        
                    }
                    
                })
                
            }
        }
    }
    
}

struct MyMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MyMenuView()
    }
}
