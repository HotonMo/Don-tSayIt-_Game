//
//  CreateNewGame.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct CreateNewGame: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var playerVM : GameVM
    @State var name1 : String = ""
    @State var AddTwoPlayer : Bool = false
    @State var AddPlayer : Bool = false
    @AppStorage("gameState") var gameStarted : Bool = false
    
    
    var body: some View {
            ZStack{
                Color.darkBeige.ignoresSafeArea()
                
                VStack( spacing: 15){
                    Text("Create new game")
                        .font(.system(size: 36)).bold()
                        .foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.lightBeige)
                        VStack{
                            HStack(alignment: .top){
                                
                                //   ScrollView(.vertical){
                                VStack( alignment: .leading){
                                    Text("Points to collect :")
                                        .font(.system(size:22))
                                        .bold()
                                    Text("Required points to collect")
                                        .font(.system(size:12))
                                        .foregroundColor(.gray)
                                    PointsView()
                                    Divider()
                                    Text("Add Players :")
                                        .bold()
                                        .font(.system(size:22))
                                    Text("At least two players without the the questioner")
                                        .font(.system(size:12))
                                        .foregroundColor(.gray)
                                    AddPlayersView()
                                        .environmentObject(playerVM)
                                    
                                    
                                }  .frame(width: UIScreen.main.bounds.width/2-70)
                                //   Spacer()
                                Divider().padding(.horizontal)
                                
                                VStack(alignment:.leading){
                                    HStack{
                                        Text("Players in the game :")
                                            .bold()
                                            .font(.system(size:22))
                                        Spacer()
                                    }
                                    if !playerVM.players.isEmpty{
                                        
                                        Playerslist()
                                        
                                    }
                                } .frame(width: UIScreen.main.bounds.width/2-70)
                          
                                
                            }.padding(.horizontal, 30)
                                .padding(.vertical, 15)
                       
                            if AddTwoPlayer{
                                Text("Add two player at least")
                                    .opacity(AddTwoPlayer ? 1 : 0)
                                    .foregroundColor(Color.costumeRed)
                            }
                                    
                  
                        }
                        Spacer()
                  
                    }
                    Button{
//                        if (playerVM.players.count == 1) {
//                            AddPlayer = true
//                            soundManger.SoundManager.instance.ClickSound(sound: .error)
                     //   }else
                    if (playerVM.players.count <= 1){
                            AddTwoPlayer = true
                            soundManger.SoundManager.instance.ClickSound(sound: .error)
                        }
                        else {
                            dismiss()
                            soundManger.SoundManager.instance.ClickSound(sound: .startedGame)
                            gameStarted = true
                        }
                    }label: {
                        ButtonView(ButtonName: "Start Game")
                        
                    }.padding(.bottom)
                        .frame(maxWidth : 400)
                     
                  
                }.padding(30)
                        .accentColor(Color(red: 0.404, green: 0.255, blue: 0.533))
                        .foregroundColor(.black)
//                        .padding(.horizontal,50)
//                       .padding(.horizontal , 200)
           //     }
                
                
            }.ignoresSafeArea(.keyboard)
            
            
            
        
    }
}




struct CreateNewGame_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewGame().environmentObject(GameVM())
    }
}
