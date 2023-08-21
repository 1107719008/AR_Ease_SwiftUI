//
//  ChooseButtonStates.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/18.
//

import Foundation
import SwiftUI
import Combine

class BodyPartSharedState: ObservableObject {
    //home choose
    @Published var isSelectedNeck = false
    @Published var isSelectedShoulder = false
    @Published var isSelectedWaist = false
    @Published var isSelectedBack = false
    @Published var isSelectedCalf = false
    
    //my menu choose
    @Published var isSelectedNeckM = true
    @Published var isSelectedShoulderM = true
    @Published var isSelectedWaistM = true
    @Published var isSelectedBackM = true
    @Published var isSelectedCalfM = true

    
    
}
