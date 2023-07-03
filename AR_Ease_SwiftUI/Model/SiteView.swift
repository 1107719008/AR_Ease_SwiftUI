//
//  SiteView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/20.
//

//this view is a sample for chart api page
import Foundation
import SwiftUI

struct SiteView: Identifiable{
//    var id = UUID().uuidString
//    var hour: Date
//    var views: Double
//    var animate: Bool = false
  
    var id = UUID().uuidString
    var day: Date
    var views: Double
    var animate: Bool = false


    
}



extension Date{
    
    func updateHour(value: Int)->Date{
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now

    }
    
    
}

func configureDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d/yyyy"
    return dateFormatter
}
let dateFormatter = configureDateFormatter()


var sample_chart : [SiteView] = [
//    SiteView(hour: Date().updateHour(value: 3),views: 3),
//    SiteView(hour: Date().updateHour(value: 9),views: 7),
//    SiteView(hour: Date().updateHour(value: 14),views: 5),
//    SiteView(hour: Date().updateHour(value: 19),views: 9),
//    SiteView(hour: Date().updateHour(value: 23),views: 1)

    SiteView(day: dateFormatter.date(from: "6/1/2023") ?? Date(), views: 2),
    SiteView(day: dateFormatter.date(from: "6/7/2023") ?? Date(), views: 9),
    SiteView(day: dateFormatter.date(from: "6/13/2023") ?? Date(), views: 6),
    SiteView(day: dateFormatter.date(from: "6/20/2023") ?? Date(), views: 14),
    //SiteView(day: dateFormatter.date(from: "6/20/2023") ?? Date(), views: 3),
    SiteView(day: dateFormatter.date(from: "6/27/2023") ?? Date(), views: 9)

    
    
]


