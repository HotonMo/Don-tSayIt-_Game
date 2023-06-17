//
//  soundManger.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI
import AVKit

struct soundManger{
    class SoundManager {
        
        static let instance = SoundManager()
        var player: AVAudioPlayer?
        enum SoundOption: String {
            case point
            case win
        }
        enum clickOption: String {
            case success
            case error
            case startedGame
        }
        
        func playSound (sound: SoundOption) {
            guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else { return }
            do {
                player = try AVAudioPlayer (contentsOf: url)
                player?.play()
                
            }catch let error {
                print ("Error playing sound. \(error.localizedDescription)")
                }
                
            }
        func ClickSound (sound: clickOption) {
            guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
            do {
                player = try AVAudioPlayer (contentsOf: url)
                player?.play()
                
            }catch let error {
                print ("Error playing sound. \(error.localizedDescription)")
                }
                
            }
            
        }
    }


