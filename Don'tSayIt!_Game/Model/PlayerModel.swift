//
//  PlayerModel.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct PlayerModel: Identifiable , Equatable ,Hashable{
    let id : String
    var name : String
    var icon : String
    var point : Int
    
    init(id : String = UUID().uuidString, name : String , icon : String , point: Int = 0) {
        self.id = id
        self.name = name
        self.icon = icon
        self.point = point
    }
    
    func updateCompletion() -> PlayerModel {
        return PlayerModel(name: name, icon: icon, point: point + 1)
    }
   
    func ResetPoints() -> PlayerModel {
        return PlayerModel(name: name, icon: icon, point: point - point )
    }
    
}
