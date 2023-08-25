//
//  DataFollowView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import Foundation

import SwiftUI

struct DataFollowView: View {
    
    @State var usedDays: Int = 26
    
    @State var currentDate: Date = Date()
    @State var whichView = 0
    @State var showDayAlert = false
    @State var dayAlertShowed = false
    
   
    
    var body: some View {
        //two mode - CalendarView/ChartView
        
            ZStack{//for change 追蹤與日曆
               
                if !dayAlertShowed {
                    Text("HI Alert").alert(isPresented: $showDayAlert) {
                        Alert(title: Text("🎉恭喜🎉")
                            .font(.custom("GenSenRoundedTW-B", size:20))
                            .foregroundColor((Color("Black_700")))
                              ,message: Text("這個月已連續運動\(String(usedDays))天!").foregroundColor((Color("Black_800")))
                        )
                    }.onDisappear(){
                        dayAlertShowed = true
                    }
                }else{
                    
                }
                    
             
                    
                
                VStack{
                    
                    ZStack{
//                        Image("RWhite").resizable().ignoresSafeArea().frame(height:48)
                        VStack{
                            
                            Image("BlueLine").offset(y:29)
                        }
                        VStack{
                            //                        Text("記錄追蹤")
                            //                            .font(.custom("GenSenRoundedTW-B", size:32))
                            //                            .foregroundColor(Color("Black_700"))
                            //                            .padding(.bottom, 38)
                            //                            .offset(x:0,y:0)
                            
                            //top switch card
                            HStack(spacing:0){
                                
                                Button{
                                    withAnimation {
                                        whichView = 0
                                    }
                                }label: {
                                    if whichView == 0 {
                                        Image("calendarPress")
                                        
                                    }else{
                                        Image("calendarUnpress")
                                    }
                                }
                                .padding(.leading, 24.0)
                                Button{
                                    withAnimation {
                                        whichView = 1
                                    }
                                }label: {
                                    if whichView == 1 {
                                        Image("followCardPress")
                                        
                                    }else{
                                        Image("followCardUnpress")
                                    }
                                    
                                }
                                
                                Spacer()
                                HStack(alignment: .bottom){
                                    //Text("連續").font(.custom("GenSenRoundedTW-B", size:16))
                                    Text("0").font(.custom("GenSenRoundedTW-B", size:24)).foregroundColor(Color.white)
                                    //Text("天").font(.custom("GenSenRoundedTW-B", size:16))
                                }.padding(.trailing, 15.0).foregroundColor(Color("EaseBlue"))
                                
                            }.offset(y:10)
                        }
                       
                    }.padding(.top,5)
                    
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing: 20){
                            if whichView == 0{
                                VStack{
                                    
//                                    ChartBarViewDemo()
//                                        .padding(0)
                                    
                                    CalenderView(currentDate: $currentDate)
                                        .background(Color("EaseGrey_100"))
                                    .matchedGeometryEffect(id: "chart", in: animation)
                                    .transition(.move(edge: .leading))
                                    .animation(.easeInOut(duration: 0.2))
                                    CalenderBelowView()//.background(Color("EaseGrey_100"))
                                        .padding(0)
                                        .offset(y:0)
                                }.background(Color("EaseGrey_100"))
                                
                            }else{
                                ChartView().padding(.top,16)
                                    .background(Color("EaseGrey_100"))
                                //.matchedGeometryEffect(id: "chart", in: animation)
                                //.transition(.move(edge: .leading))
                                //.animation(.easeInOut(duration: 0.2))
                            }
                            
                            
                        }
                    }
                    
                    
                    
                }
                
            }.onAppear{
                showDayAlert = true
              }
        
        
        //for matchGeometryEffect
        var animation: Namespace.ID {
            Namespace().wrappedValue
           }
        
        
        
        
        
        
    }
    
    
    
}

struct DataFollowView_Previews: PreviewProvider {
    static var previews: some View {
        DataFollowView()
    }
}
