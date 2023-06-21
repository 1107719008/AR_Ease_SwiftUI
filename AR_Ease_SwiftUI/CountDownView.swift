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
    
    @State var timeAlmostUp: Bool = false
    @Binding var isTimeUp: Bool
    
    //change count time here
    @State var counter: Int = 0
    
    //two var should be set to same value in production
    var countTo : Int = 30
    var timesUpTime : Int = 30
    
    var body: some View {
        VStack(alignment: .trailing){
           
            
       
            
            
            
            HStack{
//                Spacer()
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
                                    (timeAlmostUp ? (Color("EaseYellow")) : completed() ? Color.green : (Color("EaseBlue")))
                                ).animation(
                                    .easeInOut(duration: 0.2)
                                )
                        )
                    
                    
                }
            }
            
            Spacer()
            
            Image( timeAlmostUp ? "preview2" : "preview1")
            
            
        }
        
        .onReceive(timer){ time in
            if(self.counter < self.countTo){
                self.counter += 1
                
            }
            if counter >= 25 {
                timeAlmostUp = true
                
               
            }else{
                timeAlmostUp = false
            }
            if counter == timesUpTime{
                isTimeUp = true
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
        CountDownView(isTimeUp: .constant(false))
    }
}
