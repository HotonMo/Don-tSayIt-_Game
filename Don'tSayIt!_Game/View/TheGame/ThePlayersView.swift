//
//  ThePlayersView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct ThePlayersView: View {
    @EnvironmentObject var playerVM : GameVM
    var player : PlayerModel
    var body: some View {
        VStack(spacing : 3){
            Text("\(player.point)")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
            
            ZStack{
                if playerVM.isHighlighted(id: player.id)
                {
                    Circle()
                   .frame(width: 150, height: 150)
                   .foregroundColor(Color(red: 0.765, green: 0.675, blue: 0.816))
                        .opacity(0.5)
                }
                Image(player.icon)
                    .resizable().scaledToFit().frame(width: 120, height: 120)
            }.overlay {
                GeometryReader { proxy -> Color in
                    playerVM.update(
                        frame: proxy.frame(in: .global),
                        for: player.id
                    )
                    return Color.clear
                }
            }.frame(width: 140, height: 140)
            
            Text(player.name)
                .font(.system(size: 26))
             .foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
            
        }.padding(.vertical,20)
    }
}


struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        ThePlayersView(player: PlayerModel(name: "String", icon: "icon2"))
       
    }
}
