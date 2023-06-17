//
//  ChoosePartView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

struct ChoosePartView: View {
    
    @State private var isPresented = false
    
    @State private var isSelectedNeck = false
    @State private var isSelectedShoulder = false
    @State private var isSelectedWaist = false
    @State private var isSelectedBack = false
    @State private var isSelectedCalf = false
    
    //summary
    @State private var sum = 0
    @State private var sumTime = 0
    
    //set card state
    @State private var isChoseAction1 = false
    @State private var isChoseAction2 = false
    @State private var isChoseAction3 = false
    
    
    init() {
        //Customize nav bar title size
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 28)!]
    }
    
    
    var body: some View {
        
        NavigationView{
            VStack(spacing:20){
                HStack{
                   

                    Text("選擇想要的姿勢").font(.custom("GenSenRoundedTW-B", size:28))
                        .foregroundColor((Color("Black_800"))).padding(.leading, 32)
                    Spacer()
                }
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:12){
                        Button(action: {
                            isSelectedNeck.toggle()
                        }, label: {
                            if isSelectedNeck{
                                Image("NeckClicked")
                                 
                            }else{
                                Image("NeckUnclicked")
                                   
                            }
                        }
                        )
                        
                        Button(action: {
                            isSelectedShoulder.toggle()
                        }, label: {
                            if isSelectedShoulder{
                                Image("ShoulderClicked")
                                
                            }else{
                                Image("ShoulderUnclicked")
                                }
                            
                        })
                        
                        Button(action: {
                            isSelectedWaist.toggle()
                        }, label: {
                            if isSelectedWaist{
                                Image("WaistClicked")
                            }else{
                                Image("WaistUnclicked")
                            }
                            
                        })
                        
                        Button(action: {
                            isSelectedBack.toggle()
                        }, label: {
                            if isSelectedBack{
                                Image("BackClicked")
                            }else{
                                Image("BackUnclicked")
                            }
                            
                        })
                        
                        Button(action: {
                          
                                isSelectedCalf.toggle()
                           
                        }, label: {
                            if isSelectedCalf{
                                Image("CalfClicked")
                                   
                            }else{
                                Image("CalfUnclicked")
                                    
                            }
                            
                        })
 
                    }
                    .padding(.leading, 32.0)
                    
                }
                ScrollView{
                    VStack(spacing:22){
                        
                        //neck
                        if isSelectedNeck{
                            Button(action: {
                              
                                isChoseAction1.toggle()
                               
                            }, label: {
                                if isChoseAction1{
                                    Image("A2")
                                       
                                }else{
                                    Image("A1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction2.toggle()
                               
                            }, label: {
                                if isChoseAction2{
                                    Image("B2")
                                       
                                }else{
                                    Image("B1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction3.toggle()
                               
                            }, label: {
                                if isChoseAction3{
                                    Image("C2")
                                       
                                }else{
                                    Image("C1")
                                        
                                }
                                
                            })
                        }else{
                            //neck not chosen, not thing display
                                
                        }
                        //shoulder
                        if isSelectedShoulder{
                            Button(action: {
                              
                                isChoseAction1.toggle()
                               
                            }, label: {
                                if isChoseAction1{
                                    Image("A2")
                                       
                                }else{
                                    Image("A1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction2.toggle()
                               
                            }, label: {
                                if isChoseAction2{
                                    Image("B2")
                                       
                                }else{
                                    Image("B1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction3.toggle()
                               
                            }, label: {
                                if isChoseAction3{
                                    Image("C2")
                                       
                                }else{
                                    Image("C1")
                                        
                                }
                                
                            })
                        }else{
                            //shoulder not chosen, not thing display
                                
                        }
                        
                        //Waist
                        if isSelectedWaist{
                            Button(action: {
                              
                                isChoseAction1.toggle()
                               
                            }, label: {
                                if isChoseAction1{
                                    Image("A2")
                                       
                                }else{
                                    Image("A1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction2.toggle()
                               
                            }, label: {
                                if isChoseAction2{
                                    Image("B2")
                                       
                                }else{
                                    Image("B1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction3.toggle()
                               
                            }, label: {
                                if isChoseAction3{
                                    Image("C2")
                                       
                                }else{
                                    Image("C1")
                                        
                                }
                                
                            })
                        }else{
                            //waist not chosen, not thing display
                                
                        }
                        
                        
                        //Back
                        if isSelectedBack{
                            Button(action: {
                              
                                isChoseAction1.toggle()
                               
                            }, label: {
                                if isChoseAction1{
                                    Image("A2")
                                       
                                }else{
                                    Image("A1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction2.toggle()
                               
                            }, label: {
                                if isChoseAction2{
                                    Image("B2")
                                       
                                }else{
                                    Image("B1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction3.toggle()
                               
                            }, label: {
                                if isChoseAction3{
                                    Image("C2")
                                       
                                }else{
                                    Image("C1")
                                        
                                }
                                
                            })
                        }else{
                            //back not chosen, not thing display
                                
                        }
                        
                        //calf
                        if isSelectedCalf{
                            Button(action: {
                              
                                isChoseAction1.toggle()
                               
                            }, label: {
                                if isChoseAction1{
                                    Image("A2")
                                       
                                }else{
                                    Image("A1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction2.toggle()
                               
                            }, label: {
                                if isChoseAction2{
                                    Image("B2")
                                       
                                }else{
                                    Image("B1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction3.toggle()
                               
                            }, label: {
                                if isChoseAction3{
                                    Image("C2")
                                       
                                }else{
                                    Image("C1")
                                        
                                }
                                
                            })
                        }else{
                            //calf not chosen, not thing display
                                
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                }
                
                
                //TutorialView here
                NavigationLink(destination: TutorialView()){
                    
                    ZStack{//sum then go btn here
                        Image("yellowGoBtnBig")
                        VStack(alignment: .leading,spacing:5){
                            Text("共\(sum)項")
                                .font(.custom("GenSenRoundedTW-B", size:16))
                                .foregroundColor(.white)
                            Text("總共\(sumTime)分鐘")
                                .font(.custom("GenSenRoundedTW-B", size:16))
                                .foregroundColor(.white)
                            
                        }.offset(x:-15)
                    }
                }
                
                    
            }.navigationBarBackButtonHidden(true)
            
        }
    }
    
    func CalculateSumTime(_ value: Int) -> Int{
        sumTime += value
        
        return sumTime
    }
    func CalculateSum(_ value: Int) -> Int{
        sum += value
        
        return sum
    }
    
}

struct ChoosePartView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePartView()
    }
}



//custom color
//.foregroundColor((Color("Black_800")))


//tester -- full screen model view
// Button("Isss!") {
//self.isPresented.toggle()
//}
//.fullScreenCover(isPresented : $isPresented){ TutorialView()
//
//}

