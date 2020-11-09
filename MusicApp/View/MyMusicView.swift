//
//  MyMusicView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 17.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct MyMusicView: View {
    
    @ObservedObject var songsViewModel = MySongsViewModel()
    var player: Player
    
    var body: some View {
        ZStack {
            if self.songsViewModel.songs.count != 0 {
                List(self.songsViewModel.songs) { song in
                    PlayerItemView(song: song, player: self.player)
                }
            } else {
                Text("No music!")
            }
            
        }.onAppear() {
            self.songsViewModel.getSongs()
        }
        
    }
}
