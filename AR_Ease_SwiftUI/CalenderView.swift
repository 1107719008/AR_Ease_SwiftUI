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
            Text("This is data-calender page.")
            
            //days mark
            let days: [String] = ["一","二","三","四","五","六","日"]
            HStack(spacing: 20){
              
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.title3).foregroundColor((Color("Black_800")))
                }
                HStack(spacing: 10){
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.caption)
                        .fontWeight(.semibold)
                }
               
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                    
                }label: {
                    Image(systemName: "chevron.right")
                        .font(.title3).foregroundColor((Color("Black_800")))
                }
                
            }.padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(days,id: \.self){day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //Dates here
            let columns = Array(repeating: GridItem(.flexible()),count: 7)
            LazyVGrid(columns: columns,spacing: 15) {
                ForEach(extractDate()){value in
                    Text("\(value.day)")
                        .font(.title3.bold())
                }
            
            }
            
            
        }
        .onChange(of: currentMonth){ newValue in
            //change month
            currentDate = getCurrentMonth()
        }
        
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
        
        return currentMonth.getAllDates().compactMap {date -> DateValue
            in
            
            //get day
            let day = calender.component(.day ,from: date)
            
            return DateValue(day: day, date: date)
            
        }
        
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
        
        
        var range = calender.range(of: .day, in: .month, for: startDate)!
        range.removeLast()
        
        
        //get date
        return range.compactMap{day -> Date in
            
            return calender.date(byAdding: .day, value: day == 1 ? 0: day, to: startDate)!
            
        }
        
        
    }
}
