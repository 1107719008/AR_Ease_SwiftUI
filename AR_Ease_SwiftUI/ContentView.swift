//
//  ContentView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 1
    
    @EnvironmentObject var bodyChosen: BodyPartSharedState
    
    //@State var toggleHomePage: Bool = false
    @EnvironmentObject var isNotLogged: UserMood
    
    //init the tab bar bg
    init() {
        let appearance = UITabBarAppearance()
        
        appearance.configureWithTransparentBackground()
        
        let backgroundImageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        appearance.backgroundImage = UIImage(named: "tabBarShadow")?.resizableImage(withCapInsets: backgroundImageInsets)
        let tabBar = UITabBar.appearance()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    

 
    
    
    var body: some View {
        
        if isNotLogged.isNotLoggedIn{
            
            NavigationView{
                HStack{
                    //tab view
                    TabView(selection: $selection){
                        NavigationView{
                            DataFollowView()
                                .toolbar{
                                    ToolbarItem(placement: .navigationBarLeading){
                                        NavigationLink(destination: GamePageView()
                                        ){
                                            Image("GameIcon")
                                            
                                        }.navigationTitle("")
                                        
                                        
                                    }
                                    
                                    ToolbarItem(placement: .principal) {
                                        
                                        Text(selection == 0 ? "記錄追蹤" : (selection == 1 ? "Ease" : "個人設定"))
                                            .font(.custom("GenSenRoundedTW-B", size:28))
                                            .foregroundColor(Color("Black_700"))
                                        
                                        
                                    }
                                    
                                    
                                    ToolbarItem(placement: .navigationBarTrailing){
                                        NavigationLink(destination: MyMenuView()
                                        ){
                                            Image("MyList")
                                            
                                        }.navigationTitle("")
                                    }
                                }
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbarBackground(.white, for: .navigationBar)
                        }
                        .tabItem {
                            if selection == 0{
                                Text("")
                                Image("Record_press")
                            }else{
                                Text("")
                                Image("Record_unpress")
                            }
                        }.tag(0)
                        
                        NavigationView{
                            HomeView()
                                .toolbar{
                                    ToolbarItem(placement: .navigationBarLeading){
                                        NavigationLink(destination: GamePageView()
                                        ){
                                            Image("GameIcon")
                                            
                                        }.navigationTitle("")
                                        
                                        
                                    }
                                    
                                    ToolbarItem(placement: .principal) {
                                        
                                        Text(selection == 0 ? "記錄追蹤" : (selection == 1 ? "Ease" : "個人設定"))
                                            .font(.custom("GenSenRoundedTW-B", size:28))
                                            .foregroundColor(Color("Black_700"))
                                        
                                        
                                    }
                                    
                                    
                                    ToolbarItem(placement: .navigationBarTrailing){
                                        NavigationLink(destination: MyMenuView()
                                        ){
                                            Image("MyList")
                                            
                                        }.navigationTitle("")
                                    }
                                }
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbarBackground(.white, for: .navigationBar)
                        }
                        .tabItem {
                            if selection == 1{
                                Text("")
                                Image("Home_press")
                                
                            }else{
                                Text("")
                                Image("Home_unpress")
                            }
                            
                        }.tag(1)
                        
                        NavigationView{
                            SettingView().toolbar{
                                ToolbarItem(placement: .navigationBarLeading){
                                    NavigationLink(destination: GamePageView()
                                    ){
                                        Image("GameIcon")
                                        
                                    }.navigationTitle("")
                                    
                                    
                                }
                                
                                ToolbarItem(placement: .principal) {
                                    
                                    Text(selection == 0 ? "記錄追蹤" : (selection == 1 ? "Ease" : "個人設定"))
                                        .font(.custom("GenSenRoundedTW-B", size:28))
                                        .foregroundColor(Color("Black_700"))
                                    
                                    
                                }
                                
                                
                                ToolbarItem(placement: .navigationBarTrailing){
                                    NavigationLink(destination: MyMenuView()
                                    ){
                                        Image("MyList")
                                        
                                    }.navigationTitle("")
                                }
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbarBackground(.white, for: .navigationBar)
                            
                        }
                        .tabItem{
                            if selection == 2{
                                Text("")
                                Image("Setting_press")
                            }else{
                                Text("")
                                Image("Setting_unpress")
                            }
                        }.tag(2)
                    }
                    
                }//hstack end
                
                
                
            }//nav view end
            .accentColor(Color("Black_700"))
            
        }else{
            
            CheckLoginMoodView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BodyPartSharedState())
            .environmentObject(UserMood())
    }
}

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
        let array = self.viewControllers
        for controller in array! {
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -24, right: 0)
        }
    }
}


//font ref
//.font(.custom("GenSenRoundedTW-B", size:32))
//.foregroundColor(Color("Black_700"))

//button ref
//Button(action: {
//
//
//}, label: {
//
//
//})
