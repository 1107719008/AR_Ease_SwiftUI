//
//  ChoosePartView.swift
//  AR_Ease_SwiftUI
//
//  Created by 林君翰 on 2023/6/12.
//

import SwiftUI

struct ChoosePartView: View {
    
    @EnvironmentObject var bodyChosen: BodyPartSharedState
    
    @State private var isPresented = false
    
    //分頁用
    @State private var isSelectedNeckPage = false
    @State private var isSelectedShoulderPage = false
    @State private var isSelectedWaistPage = false
    @State private var isSelectedBackPage = false
    @State private var isSelectedCalfPage = false
    
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

    
    //not used
    /*func setValueBody(){
        let firstPart = bodyChosen.sortTheBodyParts()
        switch firstPart {
        case "Neck":
            isSelectedNeckPage = true
            break
        case "Shoulder":
            isSelectedShoulderPage = true
            break
        case "Waist":
            isSelectedWaistPage = true
            break
        case "Back":
            isSelectedBackPage = true
            break
        case "Calf":
            isSelectedCalfPage = true
            break
        default:
            //do nothing
            break
            
        }
    }*/
    
    func sortTheBodyParts(){
        let originalBody = [("Neck",bodyChosen.isSelectedNeck),("Shoulder",bodyChosen.isSelectedShoulder),("Waist",bodyChosen.isSelectedWaist),("Back",bodyChosen.isSelectedBack),("Calf",bodyChosen.isSelectedCalf)]
        let sortedBody = originalBody.filter { $0.1 }.map { $0.0 }
        
        switch sortedBody[0]{
        case "Neck":
            isSelectedNeckPage = true
            break
        case "Shoulder":
            isSelectedShoulderPage = true
            break
        case "Back":
            isSelectedBackPage = true
            break
        case "Waist":
            isSelectedWaistPage = true
            break
        case "Calf":
            isSelectedCalfPage = true
            break
        default:
            break
            
        }
        
    }
    
    var body: some View {
        
        NavigationView{
            VStack(spacing:20){
                HStack{
                    

                    Text("選擇想要的姿勢").font(.custom("GenSenRoundedTW-B", size:28))
                        .foregroundColor((Color("Black_800"))).padding(.leading, 30)
                    Spacer()
                }
                HStack{
                    Text("最多選擇 15 種姿勢").font(.custom("GenSenRoundedTW-R", size:12)).foregroundColor((Color("Blue_700"))).padding(.leading, 30)
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
                
                ScrollView(showsIndicators: false){
                    //分頁部位scrollview
                    VStack(spacing:22){
                        //neck
                        if isSelectedNeckPage{
                            
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
                            
                        }else if isSelectedShoulderPage{//shoulder
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
                        }else if isSelectedWaistPage{
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
                        }else if isSelectedBackPage{
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
                        }else if isSelectedCalfPage{
                            Button(action: {
                              
                                isChoseAction1.toggle()
                               
                            }, label: {
                                if isChoseAction1{
                                    Image("D2")
                                       
                                }else{
                                    Image("D1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction2.toggle()
                               
                            }, label: {
                                if isChoseAction2{
                                    Image("E2")
                                       
                                }else{
                                    Image("E1")
                                        
                                }
                                
                            })
                            Button(action: {
                              
                                isChoseAction3.toggle()
                               
                            }, label: {
                                if isChoseAction3{
                                    Image("D2")
                                       
                                }else{
                                    Image("D1")
                                        
                                }
                                
                            })
                        }else{
                            //noting chosen
                                
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                }
                
                
                //TutorialView here
                NavigationLink(destination: TutorialView()){
                    
                    ZStack{//sum then go btn here
                        Image("yellowGoBtnBig")
                        VStack(alignment: .leading,spacing:5){
                            Text("共 \(sum) 項")
                                .font(.custom("GenSenRoundedTW-B", size:16))
                                .foregroundColor(.white)
                            Text("總共 \(sumTime) 分鐘")
                                .font(.custom("GenSenRoundedTW-B", size:16))
                                .foregroundColor(.white)
                            
                        }.offset(x:-15)
                    }
                }.navigationBarBackButtonHidden(true)
                
                    
            }
            
        }
        .onAppear{
            sortTheBodyParts()
        }
        
        
    }
    
    
    
}

struct ChoosePartView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePartView().environmentObject(BodyPartSharedState())
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

