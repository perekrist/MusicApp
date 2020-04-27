//
//  Player.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 21.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import AVFoundation

class Player {
    
    var player: AVPlayer?
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func start() {
        let Url = URL(string: url)
        print("play")
        
        do {
            player = try AVPlayer(url: Url!)
            player?.play()
        } catch let error as NSError{
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
    
    func stop(){
        print("stop")
        player?.pause()
    }
}




