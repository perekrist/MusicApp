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
    
    var isPlaying = false
    var url_ = ""
    
    func start(url: URL) {
        player = AVPlayer(url: url)
        player?.play()
        isPlaying = true
        print(url)
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    func play() {
        player?.play()
        isPlaying = true
    }
    
    func playSaved(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")!
        start(url: url)
    }
    
    func downloadSong(url: URL) {
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(url.lastPathComponent)
        print(destinationUrl)
        
        if FileManager.default.fileExists(atPath: destinationUrl.path) {
            print("The file already exists at path")
            
        } else {
            URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
                guard let location = location, error == nil else { return }
                do {
                    try FileManager.default.moveItem(at: location, to: destinationUrl)
                    print("File moved to documents folder")
                } catch {
                    print(error.localizedDescription)
                }
            }).resume()
        }
        
        
    }
}




