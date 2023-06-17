//
//  SplashScreen.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//


import SwiftUI


struct SplashScreen: View {
    @StateObject var gameVM : GameVM = GameVM()
    @AppStorage("gameState") var gameStarted : Bool = false
    @State private var isEnded = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        if isEnded{
            
            if gameStarted{
                GameView()
                    .environmentObject(gameVM)
            }else{
                EnterView()
                    .environmentObject(gameVM)
            }
        }else{
 
            ZStack{
                Color(red: 0.765, green: 0.675, blue: 0.816)
                VStack{
                    Image.logo2.resizable().scaledToFit()
                  
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    
                    withAnimation{
                        self.isEnded = true
                    }
                }
            }
           
     
            .ignoresSafeArea()
           
        }
        
        
            
     
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen().environmentObject(GameVM())
    }
}
