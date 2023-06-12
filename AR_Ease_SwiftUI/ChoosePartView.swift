//
//  ChoosePartView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

struct ChoosePartView: View {
    var body: some View {
        
        ZStack{
            Image("yellowGoBtnBig")
            
            Text("選擇動作頁面-GO")
                .font(.custom("GenSenRoundedTW-B", size:16))
                .foregroundColor(.white)
                
            
        }
        
        
        
        
    }
}

struct ChoosePartView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePartView()
    }
}
