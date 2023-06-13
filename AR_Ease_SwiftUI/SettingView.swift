//
//  SettingView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import Foundation
import SwiftUI

struct SettingView: View {
    
    
    var body: some View {
        VStack{
            Text("This is setting page.")
                .foregroundColor(.indigo)
                .font(.system(size: 18))
                .padding(20)
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
