//
//  HealthStore.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/28.
//

import Foundation
import HealthKit


//init set up for healthKit

class HealthStore{
    //access healtg data
    var healthStore: HKHealthStore?
    
    init(){
        if HKHealthStore.isHealthDataAvailable(){
            healthStore = HKHealthStore()
        }
        
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void){
        //for get step count
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        guard let healthStore = self.healthStore else {
            return completion(false)
        }
            
        //read step
        healthStore.requestAuthorization(toShare: [], read: [stepType]){(success, error) in
            completion(success)
        }
        
        
    }
    
}
