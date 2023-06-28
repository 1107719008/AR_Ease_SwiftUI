//
//  CalenderView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/15.
//

import SwiftUI

struct CalenderView: View {
    @Binding var currentDate: Date
    
    //switch month by L/R arrows
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        VStack(spacing: 35){
            
            VStack{
                //days mark
                let days: [String] = ["一","二","三","四","五","六","日"]
                
                HStack(spacing: 20){
                    
                    Button{
                        withAnimation(.easeInOut(duration: 0.3)){
                            currentMonth -= 1
                        }
                    }label: {
                        Image(systemName: "chevron.left")
                            .font(.caption).foregroundColor((Color("Black_800")))
                    }
                    HStack(spacing: 10){
                        Text(extraDate()[0])
                            .font(.custom("GenSenRoundedTW-B", size:17))
                        
                        Text(extraDate()[1])
                            .font(.custom("GenSenRoundedTW-B", size:17))
                        //.fontWeight(.semibold)
                    }
                    
                    Button{
                        withAnimation{
                            currentMonth += 1
                        }
                        
                    }label: {
                        Image(systemName: "chevron.right")
                            .font(.caption).foregroundColor((Color("Black_800")))
                    }
                    
                }.padding(.all)
                
                HStack(spacing: 10){
                    ForEach(days,id: \.self){day in
                        
                        Text(day)
                        //                        .font(.callout)
                        //                        .fontWeight(.semibold)
                            .font(.custom("GenSenRoundedTW-R", size:12))
                            .frame(maxWidth:.infinity)
                            .foregroundColor((Color("Gray_300")))
                    }
                }.padding(.bottom,2)
                    .padding(.horizontal,16.5)
                
                
                //Dates here
                let columns = Array(repeating: GridItem(.flexible()),count: 7)
                LazyVGrid(columns: columns,spacing: 8) {
                    ForEach(extractDate()){value in
                        
                        CardView(value: value)
                            .background(
                                Circle()
                                    .fill(Color("EaseBlue"))
//                                    .padding(.horizontal,4)
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                                    
                            )
                            .onTapGesture {
                                    currentDate = value.date
                                
                            }
                        
                        
                    }
                    
                }.padding(.bottom,16)
                    .padding(.horizontal,16.5)
                
                
            }.background(.white)
                .padding(.bottom,0)
                .cornerRadius(10).frame(width: 361)
                .padding(.top, 16)
            
            //add calender below object here
//            CalenderBelowView()
//                .padding(.top, 0.0)
//                .offset(y:-40)
            
        }
        .onChange(of: currentMonth){ newValue in
            //change month
            currentDate = getCurrentMonth()
        }
        
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View{
       
        VStack(alignment:.center){
            
            if value.day != -1{
                
                if let record = records.first(where: { record in
                    return isSameDay(date1: record.recorddate, date2: value.date)
                }){
                    ZStack{
                        
                        Circle()
                            .fill(isSameDay(date1: record.recorddate, date2: currentDate) ? Color("EaseBlue") :
                                    Color("EaseBlue200") )
                            .frame(width: 40,height: 40)
                        
                        Text("\(value.day)")
                            .font(.custom("GenSenRoundedTW-B", size:16))
                            .foregroundColor(isSameDay(date1: record.recorddate, date2: currentDate) ? .white : Color("EaseBlue"))
                            .frame(maxWidth: .infinity)
                        
                        //Spacer()
                      
                        
                    }//zstack end
                    
                    
                }else{
                    Text("\(value.day)")
                        .font(.custom("GenSenRoundedTW-B", size:16))
                     .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : Color("Black_700"))
                     .frame(maxWidth: .infinity)
                    
                    //Spacer()
                    
                }
            }
        }
        .frame(height: 40, alignment: .center)
        
    }
    
    //checking dates
    func isSameDay(date1: Date,date2: Date) -> Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
        
        
    }
    
    
    //extract year & month
    func extraDate() -> [String]{
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_Hant_TW")//中文-地區
        formatter.dateFormat = "MMMM YYYY"
        
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    
    func getCurrentMonth()->Date{
        let calender = Calendar.current
        
        //get current month date
        guard let currentMonth = calender.date(byAdding: .month, value: self.currentMonth, to: Date())
        else{
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue]{
        
        let calender = Calendar.current
        
        //get current month
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap {date -> DateValue
            in
            
            //get day
            let day = calender.component(.day ,from: date)
            
            return DateValue(day: day, date: date)
            
        }
        
        //add offset to get week days correct
        let firstWeekday = calender.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
    
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        DataFollowView()
        
    }
}

extension Date{
    
    func getAllDates() -> [Date]{
        let calender = Calendar.current
        
        //get first date
        let startDate = calender.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        
        let range = calender.range(of: .day, in: .month, for: startDate)!
        //range.removeLast()
        
        
        //get date
        return range.compactMap{day -> Date in
            
            return calender.date(byAdding: .day, value: day - 1, to: startDate)!
            
        }
        
        
    }
}
