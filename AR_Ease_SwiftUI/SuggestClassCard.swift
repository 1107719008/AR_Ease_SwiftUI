//
//  SuggestClassCard.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

struct SuggestClassCard: View {
    
    var body: some View {
        
        ZStack{
            Image("suggestBG")
            
            VStack{
                HStack(spacing: 0){
                    Text("推薦課程").font(.custom("GenSenRoundedTW-B", size:16))
                        .foregroundColor(Color("Black_700"))
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Image("LookMorebtn")
                    }
                    
                }
                    .padding(.bottom, 5.0)
                    .padding(.horizontal,32.0)
                
                VStack(spacing: 15){
                    Image("suggestC1")
                    Image("suggestC2")
                    Image("suggestC3")
                }
            }
        }
      
        
    }
}

struct SuggestClassCard_Previews: PreviewProvider {
    static var previews: some View {
        SuggestClassCard()
    }
}




