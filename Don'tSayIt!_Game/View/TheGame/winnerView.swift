//
//  winnerView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


struct winnerView: View {
    @EnvironmentObject var playerVM : GameVM
    @AppStorage("gameState") var gameStarted : Bool = false
    var body: some View {
        ZStack{
            Image.bgWinner.resizable().ignoresSafeArea()
            VStack{
                Text("Congratulations 🥳")
                    .font(.system(size: 65)).bold()
                    .foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
                Image(playerVM.winerIcon ?? "icon1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
                Text("**\(playerVM.winerName ?? "no one")** win the game").font(.system(size: 36)).foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
                 //Text("\(playerVM.winerPoints ?? 0) Points")
                Button{
                    playerVM.generateNewGame()
                    gameStarted = false
                }label: {
                    ButtonView(ButtonName: "Back to main").padding(.horizontal,100)
                }
                
            }
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
            
            Circle()
                .fill(Color.blue)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: -100, y : -50)
            
            Circle()
                .fill(Color.red)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: 60, y : 70)
        }.onAppear{
            soundManger.SoundManager.instance.playSound(sound: .win)
        }
    }
}

struct winnerView_Previews: PreviewProvider {
    static var previews: some View {
        winnerView().environmentObject(GameVM())
    }
}
