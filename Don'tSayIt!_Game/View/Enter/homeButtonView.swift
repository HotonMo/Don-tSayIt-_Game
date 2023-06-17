//
//  homeButtonView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct homeButtonView: View {
    var ButtonName : String
    var ButtonIcon : String
    var body: some View {
        VStack(spacing : 10){
            Image(systemName: ButtonIcon).resizable().scaledToFit()
                .frame(maxHeight: 70)
            Text(ButtonName)
                .font(.system(size: 24))
        }.foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
            .frame(maxWidth: 200, maxHeight: 145)
            .background(Color(red: 0.969, green: 0.937, blue: 0.898))
            .cornerRadius(40)
        
    }
}


struct homeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        homeButtonView(ButtonName: "play game", ButtonIcon: "play.fill")
    }
}

