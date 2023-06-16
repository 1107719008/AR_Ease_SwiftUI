//
//  ChartView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/16.
//

import SwiftUI

struct ChartView: View {
   
    var body: some View {
        VStack{
            ChartBarView()
            ChartCardView()
            
            HStack{
                Text("看更多")
            }
        }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
