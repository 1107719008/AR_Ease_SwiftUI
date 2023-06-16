//
//  ChartCardView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/16.
//

import SwiftUI

struct ChartCardView: View {
    @State private var isFlippedShoulder = false
    @State private var imageFlipShoulder = "ShoulderCardF"
    @State private var isFlippedNeck = false
    @State private var imageFlipNeck = "NeckCardF"
    @State private var isFlippedWaist = false
    @State private var imageFlipWaist = "WaistCardF"
    @State private var isFlippedBack = false
    @State private var imageFlipBack = "BackCardF"
    @State private var isFlippedCalf = false
    @State private var imageFlipCalf = "CalfCardF"
    var body: some View {
        
        VStack {
            HStack{
                Image("circleChartCard").shadow(radius: 0.5)
                
                Image(imageFlipShoulder)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x: isFlippedShoulder ? -1 : 1, y: 1, anchor: .center)
                    .rotation3DEffect(.degrees(isFlippedShoulder ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isFlippedShoulder.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            imageFlipShoulder = isFlippedShoulder ? "ShoulderCardB" : "ShoulderCardF"
                        }
                    }
            }
            HStack{
                Image(imageFlipNeck)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x: isFlippedNeck ? -1 : 1, y: 1, anchor: .center)
                    .rotation3DEffect(.degrees(isFlippedNeck ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isFlippedNeck.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            imageFlipNeck = isFlippedNeck ? "NeckCardB" : "NeckCardF"
                        }
                    }
                Image(imageFlipWaist)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x: isFlippedWaist ? -1 : 1, y: 1, anchor: .center)
                    .rotation3DEffect(.degrees(isFlippedWaist ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isFlippedWaist.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            imageFlipWaist = isFlippedWaist ? "WaistCardB" : "WaistCardF"
                        }
                    }
            }
            HStack{
                Image(imageFlipBack)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x: isFlippedBack ? -1 : 1, y: 1, anchor: .center)
                    .rotation3DEffect(.degrees(isFlippedBack ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isFlippedBack.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            imageFlipBack = isFlippedBack ? "BackCardB" : "BackCardF"
                        }
                    }
                
                Image(imageFlipCalf)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x: isFlippedCalf ? -1 : 1, y: 1, anchor: .center)
                    .rotation3DEffect(.degrees(isFlippedCalf ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isFlippedCalf.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            imageFlipCalf = isFlippedCalf ? "CalfCardB" : "CalfCardF"
                        }
                    }
            }
                  
               }
        
        
    }
}

struct ChartCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChartCardView()
    }
}
