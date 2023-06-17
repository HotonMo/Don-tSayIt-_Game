//
//  GameView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


struct GameView: View {
    @EnvironmentObject var playerVM : GameVM
   // @AppStorage("gameState") var gameStarted : Bool = false
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                playerVM.update(dragPosition: state.location)
            }
            .onEnded { state in
                playerVM.update(dragPosition: state.location)
                withAnimation {
                    playerVM.confirmWhereCardWasDropped()
                }
            }
    }
    
    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 600), count: 2)
    }
    
    var body: some View {
        
        ZStack{
            Color(red: 0.969, green: 0.937, blue: 0.898)
            Image.rug.resizable().scaledToFit()
            VStack{
                LazyVGrid(columns: columns) {
                    ForEach(playerVM.players) { player in
                        ThePlayersView(player: player).environmentObject(playerVM)
                    }
                
                }
                Spacer()
                
                Button{
                    playerVM.gameEnd()
                    playerVM.resetPoints(Players: playerVM.players)
                }label: {
                    ButtonView(ButtonName: "End Game") .padding(.horizontal ,200)
                }.padding()
                
                
            }.padding(.vertical)
            if let currentCard = playerVM.currentCard {
                CardView( position: playerVM.currentPosition,
                          gesture: drag,
                          card: currentCard)
                .opacity(playerVM.CardOpacity)
            }
            
        }.ignoresSafeArea()
            .onAppear {
                playerVM.NextCard()
                print(playerVM.players)
            }.fullScreenCover(isPresented: $playerVM.isGameOver) {
                winnerView().environmentObject(playerVM)
            }
        
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(GameVM())
    }
}
