//
//  ChartBarView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/16.
//

import SwiftUI
import Charts


struct ChartBarView: View {
    
    //for animation
    @State var sampleChart: [SiteView] = sample_chart
    @State var currentTab: String = "7 Days"
    
    //gesture props
    @State var currentActiveItem: SiteView?
    @State var plotWidth: CGFloat = 0
    

    
    var body: some View {
      
        ZStack{
            VStack{
                VStack(alignment: .leading, spacing: 12){
                    
                    HStack{
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Image("yearDemo")
                            
                        Spacer()
                       
                            ZStack{
                                Image("monthBG")
                             
                                    Picker("",selection:$currentTab){
                                        Text("天").tag("7 Days")
                                        Text("週").tag("Week")
                                        Text("月").tag("Month")
                                        
                                    }
                             
                                .pickerStyle(.menu)
                                
                            }.padding(.leading,-16)
                            .padding(.trailing,16)
                        
                    }.padding(.top)
                    HStack{
                        Text("時間 min").fontWeight(.semibold).font(.custom("GenSenRoundedTW-B", size:12))
                            .foregroundColor(Color("Gray_300")).padding(.leading,16)
                    }
                    
                    let totalValue = sampleChart.reduce(0.0) { partialResult, item in
                        item.views + partialResult
                    }
                    
                    //show total
                    //Text(totalValue.stringFormat)
                    
                    
                    AnimatedChart()
                    
                    HStack{
                        Spacer()
                        Text("日期").font(.custom("GenSenRoundedTW-B", size:12))
                        .foregroundColor(Color("Gray_300"))
                        Spacer()
                    }.padding(.bottom,16)
                        .padding(.top,-8)
                    
                }.background{
                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .fill(.white/*.shadow(.drop(radius: 2))*/)
                    
                }.padding(.horizontal,16)
                
                
                //ref pic
               // Image("juneChart")
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            
            .onChange(of: currentTab) { newvalue in
                sampleChart = sample_chart
                if newvalue == "Week"{
                        for (index,_) in sampleChart.enumerated(){
                            sampleChart[index].views = .random(in: 30...50)
                        }
                }else if newvalue == "Month"{
                    for (index,_) in sampleChart.enumerated(){
                        sampleChart[index].views = .random(in: 40...90)
                    }
                }
                
                //re animate view
                animateGraph(fromChange: true)
                
            }
            
            
            
            
        }
        
        
    }
    
    
    @ViewBuilder
    func AnimatedChart() -> some View{
        let max = sampleChart.max{item1,item2 in
            return item2.views > item1.views
        }?.views ?? 0
        
        Chart{
          
            ForEach(sampleChart){item in
                
                    BarMark(
                        x: .value("Day", item.day,unit:.weekOfMonth),
                        y: .value("min", item.animate ? item.views : 0)
                    )
                    //apply style
                    .foregroundStyle(Color("EaseYellow"))
                    .cornerRadius(100)
                    
                    
                    
                    //rule for dragging items -- a line
              
                   
                
                                                
                    if let currentActiveItem,currentActiveItem.id == item.id{
                        RuleMark(x: .value("Date", currentActiveItem.day)).foregroundStyle(.clear)
                        //set in mid of each bar
                        //.offset(x:(plotWidth / CGFloat(sampleChart.count)) / 2)
                            .offset(x:10)
                            .annotation(position: .top){
//                                VStack(alignment: .leading, spacing: 6){
//                                    Text("High").font(.caption)
//                                        .foregroundColor(.gray)
//                                    Text(currentActiveItem.views.stringFormat)
//                                        .font(.title3.bold())
//                                }.offset(y:50)
//                                .padding(.horizontal,20)
//                                .padding(.vertical,4)
                                Image("topHigh").offset(y:40)
                            }
                    }
                
                
            }
                
           
        }
        //remove the vertical lines
        .chartXAxis {
            AxisMarks(position: .bottom,values: sampleChart.map{$0.day}) { day in
                // AxisGridLine().foregroundStyle(.clear)
                //AxisTick()//.foregroundStyle(.clear)
                AxisValueLabel(format: .dateTime.day())
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
            
        }
        .padding(.horizontal,16)
        .frame(height:180)
        .chartYScale(domain: 0...(max+20))
        //highlight chosen bar
        .chartOverlay(content: { proxy in
            GeometryReader{ innerProxy in
                Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                    .gesture(
                        DragGesture().onChanged{ value in
                            //get current value - extract the date
                            let location = value.location
                            
                            if let date: Date = proxy.value(atX: location.x){
                                let calendar = Calendar.current
                                let day = calendar.component(.day, from: date)
                                if let currentItem = sampleChart.first(where: {item in
                                    calendar.component(.day, from: item.day) == day
                                }){
                                    self.currentActiveItem = currentItem
                                    self.plotWidth = proxy.plotAreaSize.width
                                }
                                
                            }
                        }.onEnded{ value in
                            self.currentActiveItem = nil
                        }
                    )
                
            }
            
        })
        
        .onAppear{
            animateGraph()
        }
    }
        
        //animating graph
    func animateGraph(fromChange: Bool = false){
        for(index,_) in sampleChart.enumerated(){
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.03 : 0.05)){
                withAnimation(fromChange ? .easeInOut(duration: 0.8) : .interactiveSpring(response: 0.8, dampingFraction: 0.8,blendDuration: 0.8)){
                    sampleChart[index].animate = true
                    
                }
                
            }
        }
        
        
    }
    
    func getWeekOfYear(for date: Date) -> Int {
           let calendar = Calendar.current
           return calendar.component(.weekOfYear, from: date)
       }

    
    
    
    
    
}

struct ChartBarView_Previews: PreviewProvider {
    static var previews: some View {
        ChartBarView()
    }
}


extension Double{
    var stringFormat: String{
        if self >= 10000 && self < 999999{
            return String(format: "%.1fK", self/1000).replacingOccurrences(of: ".0", with: "")
        }
        if self > 999999{
            return String(format: "%.1fM", self/1000000).replacingOccurrences(of: ".0", with: "")
        }
        return String(format: "%.0f", self)
    }
}
