//
//  cardModel.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//
import SwiftUI

struct cardModel : Identifiable {
let id = UUID().uuidString
let word: String
let forbiddenWords : [String]
}

