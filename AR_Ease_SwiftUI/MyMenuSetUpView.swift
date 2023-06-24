//
//  MyMenuSetUp.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/21.
//

import SwiftUI

struct MyMenuSetUpView: View {
    
    @EnvironmentObject var bodyChosen: BodyPartSharedState
    
    @State private var isSelectedNeckPage = false
    @State private var isSelectedShoulderPage = false
    @State private var isSelectedWaistPage = false
    @State private var isSelectedBackPage = true
    @State private var isSelectedCalfPage = false
    
    //summary
    @State private var sum = 0
    @State private var sumTime : Double = 0
    
    //set card state
    @State private var isChoseActionN1 = false
    @State private var isChoseActionN2 = false
    @State private var isChoseActionN3 = false
    
    @State private var isChoseActionS1 = false
    @State private var isChoseActionS2 = false
    @State private var isChoseActionS3 = false
    
    @State private var isChoseActionW1 = false
    @State private var isChoseActionW2 = false
    @State private var isChoseActionW3 = false
    
    @State private var isChoseActionB1 = false
    @State private var isChoseActionB2 = false
    @State private var isChoseActionB3 = false
    
    @State private var isChoseActionC1 = false
    @State private var isChoseActionC2 = false
    @State private var isChoseActionC3 = false
    
    
    //for enter menu name
    @State private var presentAlert = false
       @State private var menuName: String = ""
      
    
    
    var body: some View {
       
        VStack(spacing:20){
            HStack{
                
                
                Text("選擇想要的姿勢").font(.custom("GenSenRoundedTW-B", size:28))
                    .foregroundColor((Color("Black_800"))).padding(.leading, 30)
                Spacer()
            }
            HStack{
                Text("最多選擇 15 種姿勢").font(.custom("GenSenRoundedTW-R", size:12)).foregroundColor((Color("EaseBlue"))).padding(.leading, 30)
                Spacer()
            }
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:12){
                    if bodyChosen.isSelectedNeck{
                        Button(action: {
                            isSelectedNeckPage = true
                            isSelectedShoulderPage = false
                            isSelectedBackPage = false
                            isSelectedWaistPage = false
                            isSelectedCalfPage = false
                            
                        }, label: {
                            if isSelectedNeckPage{
                                Image("NeckClicked")
                                
                            }else{
                                Image("NeckUnclicked")
                                
                            }
                        })
                    }
                    
                    if bodyChosen.isSelectedShoulder{
                        Button(action: {
                            isSelectedNeckPage = false
                            isSelectedShoulderPage = true
                            isSelectedBackPage = false
                            isSelectedWaistPage = false
                            isSelectedCalfPage = false
                        }, label: {
                            if isSelectedShoulderPage{
                                Image("ShoulderClicked")
                                
                            }else{
                                Image("ShoulderUnclicked")
                            }
                            
                        })
                    }
                    
                    if bodyChosen.isSelectedWaist{
                        Button(action: {
                            isSelectedNeckPage = false
                            isSelectedShoulderPage = false
                            isSelectedBackPage = false
                            isSelectedWaistPage = true
                            isSelectedCalfPage = false
                        }, label: {
                            if isSelectedWaistPage{
                                Image("WaistClicked")
                            }else{
                                Image("WaistUnclicked")
                            }
                            
                        })
                    }
                    
                    if bodyChosen.isSelectedBack{
                        Button(action: {
                            isSelectedNeckPage = false
                            isSelectedShoulderPage = false
                            isSelectedBackPage = true
                            isSelectedWaistPage = false
                            isSelectedCalfPage = false
                        }, label: {
                            if isSelectedBackPage{
                                Image("BackClicked")
                            }else{
                                Image("BackUnclicked")
                            }
                            
                        })
                    }
                    
                    if bodyChosen.isSelectedCalf{
                        Button(action: {
                            isSelectedNeckPage = false
                            isSelectedShoulderPage = false
                            isSelectedBackPage = false
                            isSelectedWaistPage = false
                            isSelectedCalfPage = true
                            
                        }, label: {
                            if isSelectedCalfPage{
                                Image("CalfClicked")
                                
                            }else{
                                Image("CalfUnclicked")
                                
                            }
                            
                        })
                    }
                    
                    
                }
                .padding(.leading, 32.0)
                
            }
            
            ZStack{
                ScrollView(showsIndicators: false){
                    //分頁部位scrollview
                    VStack(spacing:10){
                        //neck
                        if isSelectedNeckPage{
                            
                            Button(action: {
                                
                                isChoseActionN1.toggle()
                                if isChoseActionN1 {
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime -= 1
                                }
                                
                                
                            }, label: {
                                if isChoseActionN1{
                                    Image("A2")
                                    
                                }else{
                                    Image("A1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionN2.toggle()
                                if isChoseActionN2 {
                                    sum += 1
                                    sumTime += 0.5
                                }else{
                                    sum -= 1
                                    sumTime -= 0.5
                                }
                            }, label: {
                                if isChoseActionN2{
                                    Image("B2")
                                    
                                }else{
                                    Image("B1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionN3.toggle()
                                if isChoseActionN3 {
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime -= 1
                                }
                            }, label: {
                                if isChoseActionN3{
                                    Image("C2")
                                    
                                }else{
                                    Image("C1")
                                    
                                }
                                
                            })
                            
                        }else if isSelectedShoulderPage{//shoulder
                            Button(action: {
                                
                                isChoseActionS1.toggle()
                                if isChoseActionS1 {
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime -= 1
                                }
                                
                            }, label: {
                                if isChoseActionS1{
                                    Image("A2")
                                    
                                }else{
                                    Image("A1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionS2.toggle()
                                if isChoseActionS2 {
                                    
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime -= 1
                                }
                                
                            }, label: {
                                if isChoseActionS2{
                                    Image("B2")
                                    
                                }else{
                                    Image("B1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionS3.toggle()
                                if isChoseActionS3 {
                                    sum += 1
                                }else{
                                    sum -= 1
                                }
                                
                            }, label: {
                                if isChoseActionS3{
                                    Image("C2")
                                    
                                }else{
                                    Image("C1")
                                    
                                }
                                
                            })
                        }else if isSelectedWaistPage{
                            Button(action: {
                                
                                isChoseActionW1.toggle()
                                if isChoseActionW1 {
                                    sum += 1
                                }else{
                                    sum -= 1
                                }
                                
                            }, label: {
                                if isChoseActionW1{
                                    Image("A2")
                                    
                                }else{
                                    Image("A1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionW2.toggle()
                                if isChoseActionW2 {
                                    sum += 1
                                }else{
                                    sum -= 1
                                }
                                
                            }, label: {
                                if isChoseActionW2{
                                    Image("B2")
                                    
                                }else{
                                    Image("B1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionW3.toggle()
                                if isChoseActionW3 {
                                    sum += 1
                                }else{
                                    sum -= 1
                                }
                                
                            }, label: {
                                if isChoseActionW3{
                                    Image("C2")
                                    
                                }else{
                                    Image("C1")
                                    
                                }
                                
                            })
                        }else if isSelectedBackPage{
                            Button(action: {
                                
                                isChoseActionB1.toggle()
                                if isChoseActionB1 {
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime -= 1
                                }
                                
                            }, label: {
                                if isChoseActionB1{
                                    Image("A2")
                                    
                                }else{
                                    Image("A1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionB2.toggle()
                                if isChoseActionB2 {
                                    sum += 1
                                    sumTime += 0.5
                                }else{
                                    sum -= 1
                                    sumTime -= 0.5
                                }
                                
                            }, label: {
                                if isChoseActionB2{
                                    Image("B2")
                                    
                                }else{
                                    Image("B1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionB3.toggle()
                                if isChoseActionB3 {
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime -= 1
                                }
                                
                            }, label: {
                                if isChoseActionB3{
                                    Image("C2")
                                    
                                }else{
                                    Image("C1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionB1.toggle()
                                if isChoseActionB1 {
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime += 1
                                }
                                
                            }, label: {
                                if isChoseActionB1{
                                    Image("A1")
                                    
                                }else{
                                    Image("A1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionB2.toggle()
                                if isChoseActionB2 {
                                    sum += 1
                                    sumTime += 0.5
                                }else{
                                    sum -= 1
                                    sumTime -= 0.5
                                }
                                
                            }, label: {
                                if isChoseActionB2{
                                    Image("B1")
                                    
                                }else{
                                    Image("B1")
                                    
                                }
                                
                            })
                        }else if isSelectedCalfPage{
                            Button(action: {
                                
                                isChoseActionC1.toggle()
                                if isChoseActionC1 {
                                    sum += 1
                                    sumTime += 1
                                }else{
                                    sum -= 1
                                    sumTime -= 1
                                }
                                
                            }, label: {
                                if isChoseActionC1{
                                    Image("D2")
                                    
                                }else{
                                    Image("D1")
                                    
                                }
                                
                            })
                            Button(action: {
                                
                                isChoseActionC2.toggle()
                                if isChoseActionC2 {
                                    sum += 1
                                    sumTime += 0.4
                                }else{
                                    sum -= 1
                                    sumTime -= 0.4
                                }
                                
                            }, label: {
                                if isChoseActionC2{
                                    Image("E2")
                                    
                                }else{
                                    Image("E1")
                                    
                                }
                                
                            })
                            
                        }else{
                            //noting chosen
                            
                        }
                        
                        
                    }
                }
                
                
                VStack{
                    Spacer()
                    
                    HStack{
                        Spacer()
                      
                        Button(action: {
                            presentAlert = true
                            
                        }, label: {
                            
                            ZStack{//sum then go btn here
                                Image("yellowGoBtnBig")
                                VStack(alignment: .leading,spacing:5){
                                    let formattedValue = String(format: "%.1f", sumTime)
                                    let finalValue = formattedValue.replacingOccurrences(of: ".0", with: "")
                                    Text("共 \(sum) 項，\(finalValue) 分鐘")
                                        .font(.custom("GenSenRoundedTW-B", size:16))
                                        .foregroundColor((Color("Black_700")))
                                    
                                    
                                    
                                }.offset(x:-15)
                            }
                            
                            
                        }).alert("菜單名稱", isPresented: $presentAlert, actions: {
                            TextField("菜單名稱", text: $menuName)//.font(.custom("GenSenRoundedTW-B", size:16))
                                .foregroundColor((Color("Black_700")))

                            Button("確認", action: {})
                            Button("取消", role: .cancel, action: {})
                            
                        }, message: {
                            Text("請輸入菜單名稱")//.font(.custom("GenSenRoundedTW-B", size:12))
                                .foregroundColor((Color("Black_700")))
                        })
                            
                            
                            
                        
                        
                        
                        
                        
                    }//hstack end
                    .padding(.trailing,16)
                    
                    
                }
            }
        }
    }
}

struct MyMenuSetUpVView_Previews: PreviewProvider {
    static var previews: some View {
        MyMenuSetUpView()
    }
}


//alert ref
//Button("Show Alert") {
//            presentAlert = true
//        }
//        .alert("菜單名稱", isPresented: $presentAlert, actions: {
//            TextField("菜單名稱", text: $menuName).font(.custom("GenSenRoundedTW-B", size:12))
//                .foregroundColor((Color("Black_700")))
//
//            Button("確認", action: {})
//            Button("取消", role: .cancel, action: {})
//
//        }, message: {
//            Text("請輸入菜單名稱").font(.custom("GenSenRoundedTW-B", size:12))
//                .foregroundColor((Color("Black_700")))
//        })
