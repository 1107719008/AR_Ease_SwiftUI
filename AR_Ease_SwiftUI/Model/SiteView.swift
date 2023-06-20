//
//  SiteView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/20.
//

//this view is a sample for chart
import Foundation
import SwiftUI

struct SiteView: Identifiable{
    var id = UUID().uuidString
    var hour: Date
    var views: Double
    var animate: Bool = false
}

extension Date{
    
    func updateHour(value: Int)->Date{
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
    
}

var sample_chart : [SiteView] = [
    SiteView(hour: Date().updateHour(value: 4),views: 3),
    SiteView(hour: Date().updateHour(value: 9),views: 7),
    SiteView(hour: Date().updateHour(value: 14),views: 5),
    SiteView(hour: Date().updateHour(value: 19),views: 9),
    SiteView(hour: Date().updateHour(value: 23),views: 1)
    
]
