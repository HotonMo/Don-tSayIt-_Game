//
//  EnterView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


struct EnterView: View {
    @State private var ShowPlayRules = false
  
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 1.000, green: 0.984, blue: 0.961).ignoresSafeArea()
                
                VStack{
                    Image.logo.resizable().scaledToFit()
                    
                    HStack(spacing : 40){
                        NavigationLink{
                            CreateNewGame()
                        }label: {
                            homeButtonView(ButtonName: "Start game", ButtonIcon: "play.fill")
                        }
                        
                        Button {
                            ShowPlayRules.toggle()
                        }label: {
                            homeButtonView(ButtonName: "How to play", ButtonIcon: "questionmark")
                        }
                       
                    }
                    Image.homepage.resizable().scaledToFit()
                }.fullScreenCover(isPresented: $ShowPlayRules) {
                    HowToPlayView()
                }
            }.ignoresSafeArea(.keyboard)
        }
    }
}

struct EnterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterView()
    }
}
