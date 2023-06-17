//
//  playersIcons.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct playersIcons: View {
    @Binding var selectedIcon : String
    var body: some View {
        HStack{
            ForEach(icons.allCases , id: \.self) { icon in
                Button{
                    selectedIcon = icon.image
                    
                    print(selectedIcon)
                }label: {
                    ZStack{
                        if selectedIcon == icon.image{
                            Circle()
                                .frame(height: 80)
                                .foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533)).blur(radius: 5)
                        }
                        Image(icon.image).resizable().scaledToFit().frame(height: 80)
                    }
                }
            }
        }
    }
}

struct playersIcons_Previews: PreviewProvider {
    static var previews: some View {
        playersIcons(selectedIcon: Binding<String>.constant("icon1"))
    }
}
