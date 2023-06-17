//
//  ButtonView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct ButtonView: View {
    var ButtonName :String
    var body: some View {
        
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
            .frame(height: 56)
            .padding(.horizontal,40)
            .overlay {
                Text(ButtonName)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.969, green: 0.937, blue: 0.898))
            }
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(ButtonName: "String")
    }
}
