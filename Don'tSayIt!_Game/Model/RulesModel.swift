//
//  RulesModel.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


func CurrentCard(index : Int) -> HowToPlay{
    
    let Index : Int =  index
    switch Index{
    case 0 :
        return HowToPlay.First
    case 1 :
        return HowToPlay.Second
    case 2 :
        return HowToPlay.Third
    case 3 :
        return HowToPlay.Forth
    default:
        return HowToPlay.First
    }
}


enum HowToPlay: CaseIterable , Identifiable {
    var id: Self {

          return self
      }
    
    
    case First
    case Second
    case Third
    case Forth
    
    var image_R: String {
        switch self {
        case .First:
            return "first_R"
        case .Second:
            return "second_R"
        case .Third:
            return "third"
        case .Forth:
            return "forth_R"
        }
    }
    
    var image_L: String {
        switch self {
            case .First:
                return "first_L"
            case .Second:
                return "second_L"
            case .Third:
                return ""
            case .Forth:
                return "forth_L"
            }
    }
    
    var Text_R: Text {
        switch self {
            case .First:
                return Text(" **Don’t Say It** is a multiplayer words game about who can guess the word first")
            case .Second:
                return Text("First, choose the **number of points** that you need to collect in order to win ")
            case .Third:
                return Text("After that give the iPad to **The questioner** ")
            case .Forth:
                return Text("The questioner will hold the iPad and start describing the **Main word** without saying any of the **forbidden words**")
            }
    }
    
    var Text_L: Text {
        switch self {
            case .First:
                return Text("You must be three players at least. One of you will be **the questioner**.")
            case .Second:
                return Text("Then, let each player add his **name** and **icon** ")
            case .Third:
                return Text("")
            case .Forth:
                return Text("If any player finds out the **main word** the questioner should drag the card to the player icon to give him the points")
            }
    }
   
}



