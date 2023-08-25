//
//  AR_Ease_SwiftUIApp.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import SwiftUI

@main
struct AR_Ease_SwiftUIApp: App {
    @StateObject var bodyChosen = BodyPartSharedState()
    @StateObject var isNotLoggedIn = UserMood() //user states
    
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.light)//light mood
                .environmentObject(bodyChosen)
                .environmentObject(isNotLoggedIn)
        }
    }
}
