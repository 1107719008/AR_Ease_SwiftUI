//
//  CountDownView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct CountDownView: View {
    
    //change count time here
    @State var counter: Int = 0
    var countTo : Int = 30
    
    
    var body: some View {
        VStack{
            ZStack{
                Image("clockBG70").resizable().frame(width: 72,height: 72)
                //counter
                Clock(counter: counter, countTo: countTo)
                Circle().fill(Color.clear)
                    .frame(width: 60,height: 60)
                    .overlay(Circle().stroke(Color.gray.opacity(0.2),lineWidth: 6))
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60,height: 60)
                    .overlay(
                        Circle().trim(from:0, to: progessBar())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 6,
                                    lineCap: .round,
                                    lineJoin: .round
                                )
                            )
                            .foregroundColor(
                                (completed() ? Color.green : Color.yellow)
                            ).animation(
                                .easeInOut(duration: 0.2)
                            )
                    )
                
                
            }
        }
        
        .onReceive(timer){ time in
            if(self.counter < self.countTo){
                self.counter += 1
            }
        }
        
    }
    
    func completed() -> Bool{
        return progessBar() == 1
    }
    
    //progessBar's progress - animation
    func progessBar() -> CGFloat{
        return (CGFloat(counter)/CGFloat(countTo))
    }
    
}

//add clock count
struct Clock : View{
    var counter : Int
    var countTo : Int
    
    var body: some View{
       
        VStack{
                Text(counterToMinutes())
                    .font(.custom("GenSenRoundedTW-B", size: 32))
                    .fontWeight(.black)
                    .foregroundColor(Color.black.opacity(0.8))
        }
            
    }
        
    
    
    func counterToMinutes() -> String{
        let currentTime = countTo - counter
        return "\(currentTime)"
    }
    
    
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView()
    }
}
