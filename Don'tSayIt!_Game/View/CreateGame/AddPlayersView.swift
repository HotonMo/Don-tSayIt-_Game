//
//  AddPlayersView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


enum icons :CaseIterable{
    case icon1
    case icon2
    case icon3
    case icon4
    
    var image: String {
        switch self {
        case .icon1:
            return "icon1"
        case .icon2:
            return "icon2"
        case .icon3:
            return "icon3"
        case .icon4:
            return "icon4"
        }
    }
}
struct AddPlayersView: View {
    
    @State var playerName : String = ""
    @State var selectedIcon : String = "icon1"
    @State var checkRequiredField : Bool = false
    @EnvironmentObject var playerVM : GameVM
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Enter player name :")
                .font(.system(size:22))
          
            
            TextField("player name", text: $playerName)
                .padding()
                .background(Color(red: 1.000, green: 0.984, blue: 0.961))
                .cornerRadius(20)
            Text("Choose an icon :")
                .font(.system(size:22))
              
            
            playersIcons(selectedIcon: $selectedIcon)
                .frame(maxWidth: .infinity)
            Button{
                if playerName.isEmpty{
                    checkRequiredField = true
                    soundManger.SoundManager.instance.ClickSound(sound: .error)
                }else{
                    
                    checkRequiredField = false
                    playerVM.addPlayer(Name: playerName, Icon: selectedIcon)
                    soundManger.SoundManager.instance.ClickSound(sound: .success)
                    playerName = ""
                }
                
            }label: {
                ButtonView(ButtonName:"Add player + " )
            }
            
                Text("please enter player name")
                    .opacity(checkRequiredField ? 1 : 0)
                    .foregroundColor(Color.costumeRed)
                    .frame(maxWidth: .infinity)
             
       
            
        }//.ignoresSafeArea(.keyboard)
            .foregroundColor(.black)
            .padding()
            .background(Color.lightPurple)
            .cornerRadius(15)
    }
    
}


struct AddPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayersView().environmentObject(GameVM())
    }
}
