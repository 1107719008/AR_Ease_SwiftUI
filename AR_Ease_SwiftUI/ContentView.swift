//
//  ContentView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 1

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
        NavigationView{
            HStack{
                //tab view
                TabView(selection: $selection){
                    
                    DataFollowView()
                        .tabItem {
                            if selection == 0{
                                Text("")
                                Image("Record_press")
                            }else{
                                Text("")
                                Image("Record_unpress")
                            }
                        }.tag(0)
                    
                    HomeView()
                        .tabItem {
                            if selection == 1{
                                Text("")
                                Image("Home_press")
                                
                            }else{
                                Text("")
                                Image("Home_unpress")
                            }
                            
                        }.tag(1)
                    
                    SettingView()
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
            
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        
                    }, label: {
                        Image("GameIcon").padding(10)
                        
                    })
                    
                }
          
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        
                    }, label: {
                        Image("MyList").padding(10)
                        
                        
                    })
                }
            }
            
        }//nav view end
            
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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

