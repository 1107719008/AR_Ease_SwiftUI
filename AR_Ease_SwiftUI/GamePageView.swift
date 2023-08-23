//
//  GamePageView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/18.
//

import SwiftUI

struct GamePageView: View {
    
    @EnvironmentObject var tabSelect: UserMood
    
    var body: some View {
        
        
            
        VStack{
          
            HStack{
                Button(action: {
                    // 所需執行的內容
                    tabSelect.seletionTab = 0
                    
                }) {
                    // 按鈕介面外觀設置
                    Image("BackIcon3")
                    
                }
                .padding([.leading, .bottom, .trailing],16)
                    .padding(.top,35)
                    
                    
            
                Spacer()
                
            }
            
            
            //Image("GamePageDemo")
              Image("Bpose")
            
            
            
            
        }
            
       
        
        
    }
        
}

struct GamePageView_Previews: PreviewProvider {
    static var previews: some View {
        GamePageView()
    }
}
