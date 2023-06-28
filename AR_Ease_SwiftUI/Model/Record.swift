//
//  Record.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/15.
//

import SwiftUI

//record array
struct Record: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//all record
struct RecordMetaData: Identifiable{
    var id = UUID().uuidString
    var record: [Record]
    var recorddate: Date
}


//sample tester
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var records:[RecordMetaData] = [

        RecordMetaData(record: [
            Record(title: "go swimming"),
            Record(title: "noting to do")
        
        ], recorddate: getSampleDate(offset: -1)),
        RecordMetaData(record: [
            Record(title: "go home")
        ], recorddate: getSampleDate(offset: -2)),
        RecordMetaData(record: [
            Record(title: "go home")
        ], recorddate: getSampleDate(offset: -4)),
        RecordMetaData(record: [
            Record(title: "go home")
        ], recorddate: getSampleDate(offset: -5)),
        RecordMetaData(record: [
            Record(title: "go home")
        ], recorddate: getSampleDate(offset: -10)),
        
        RecordMetaData(record: [
            Record(title: "go school")
        ], recorddate: getSampleDate(offset: -3)),
        
        RecordMetaData(record: [
            Record(title: "play games")
        ], recorddate: getSampleDate(offset: -28)),
        RecordMetaData(record: [
            Record(title: "play games")
        ], recorddate: getSampleDate(offset: -35)),
        RecordMetaData(record: [
            Record(title: "play games")
        ], recorddate: getSampleDate(offset: -38)),
        RecordMetaData(record: [
            Record(title: "play games")
        ], recorddate: getSampleDate(offset: -44)),
        RecordMetaData(record: [
            Record(title: "play games")
        ], recorddate: getSampleDate(offset: -6))


]



