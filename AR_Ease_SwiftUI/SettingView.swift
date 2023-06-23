//
//  SettingView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/9.
//

import Foundation
import SwiftUI

struct SettingView: View {
    
    @State private var isHealthKit = false
    @State private var isSoundTutorial = false
    
    @State var isSelect: String = "Easy"
  
    var body: some View {
        
        
        VStack{
           
            HStack{
                VStack{
                    Image("profileA").padding(12)
                    Text("阿翰").font(.custom("GenSenRoundedTW-B", size:22))
                        .foregroundColor(Color("Black_700")).padding(.bottom,10)
                }
            }
            HStack{
                Image("setState").padding(.bottom,21)
            }
            
            VStack{
                HStack{
                    Text("難易度調整").font(.custom("GenSenRoundedTW-B", size:15))
                        .foregroundColor(Color("EaseBlue"))
                        .padding(.leading, 25.0)
                    Spacer()
                }
                //muti toggle btn
                Picker("",selection:$isSelect){
                    Text("入門").tag("Easy").font(.custom("GenSenRoundedTW-B",size: 13))
                    Text("基礎").tag("Basic").font(.custom("GenSenRoundedTW-B",size: 13))
                    Text("進階").tag("Difficult").font(.custom("GenSenRoundedTW-B",size: 13))
                }
                .pickerStyle(.segmented)
                .padding(.horizontal,24)
                .padding(.top,5)
                //.colorMultiply(Color("EaseBlue"))
                
                
            }
            VStack{
//                HStack{
//                    Text("一般設定").padding(.leading, 25.0)
//                    Spacer()
//                }
                
                //List & toggle btn
                NavigationView{
                    List{
                        Section{
                            HStack {
                                Image("iconPerson")
                                    .foregroundColor(.blue)
                                Text("基本資料").font(.custom("GenSenRoundedTW-B",size: 15)).foregroundColor(Color("Black_700"))
                                Spacer ()
                                //Text("1")
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color("Gray_300"))
                            }
                            HStack {
                                Image("iconNotify")
                                    .foregroundColor(.blue)
                                Text("提醒運動").font(.custom("GenSenRoundedTW-B",size: 15)).foregroundColor(Color("Black_700"))
                                Spacer ()
                                //Text("1")
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color("Gray_300"))
                            }
                            HStack {
                                Image("iconSound")
                                    .foregroundColor(Color("Black_700"))
                                Text("聲音與音效").font(.custom("GenSenRoundedTW-B",size: 15)).foregroundColor(Color("Black_700"))
                                Spacer ()
                                //Text("1")
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color("Gray_300"))
                            }
                            HStack {
                                Image("iconLanguage")
                                    .foregroundColor(Color("Black_700"))
                                Text("語言選擇").font(.custom("GenSenRoundedTW-B",size: 15)).foregroundColor(Color("Black_700"))
                                Spacer ()
                                //Text("1")
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color("Gray_300"))
                            }
                            HStack{
                                Image("iconMic")
                                Toggle("語音教學", isOn: $isSoundTutorial).font(.custom("GenSenRoundedTW-B",size: 15)).foregroundColor(Color("Black_700")).tint(Color("EaseBlue"))
                            }
                            HStack{
                                Image("healthIcon")
                                Toggle("Apple Health", isOn: $isHealthKit).font(.custom("GenSenRoundedTW-B",size: 15)).foregroundColor(Color("Black_700")).tint(Color("EaseBlue"))
                            }
                            
                            
                        }
                    header: {
                        Text("一般設定").font(.custom("GenSenRoundedTW-B", size:15))
                            .foregroundColor(Color("EaseBlue"))
                            
                    }
                    }//list end
                    .scrollContentBackground(.hidden)
                    //.offset(x:-12)
                    .frame(width: 415)
                    
                    
                }
                
                
                
            }
            
            
        }
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
