//
//  Playerslist.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct Playerslist: View {
    @EnvironmentObject var playerVM : GameVM
    var body: some View {
        VStack{
            ForEach(playerVM.players) {Players in
                let index = playerVM.players.firstIndex(of: Players)
                singlePlayerView(player: PlayerModel(name: Players.name, icon: Players.icon ), index: IndexSet(integer: index!))
                Divider()
            }
        }
    }
    
}

struct Playerslist_Previews: PreviewProvider {
    static var previews: some View {
        Playerslist().environmentObject(GameVM())
    }
}
