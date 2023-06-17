//
//  Don_tSayIt__GameApp.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

@main
struct Don_tSayIt__GameApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen().environmentObject(GameVM())
        }
    }
}
