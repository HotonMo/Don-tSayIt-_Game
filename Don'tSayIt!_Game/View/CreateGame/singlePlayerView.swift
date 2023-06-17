//
//  singlePlayerView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


struct singlePlayerView: View {
    @EnvironmentObject var playerVM : GameVM
    let player : PlayerModel
    var index : IndexSet
    var body: some View {
        HStack{
            Image(player.icon)
                .resizable().scaledToFit().frame(maxWidth: 80)
            Text(player.name)
            Spacer()
            Button{
                playerVM.deletePlayer(indexSet: index)
            }label: {
                Image(systemName: "x.circle")
            }
            
        }.padding()
    }
}
//struct singlePlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        singlePlayerView()
//    }
//}
