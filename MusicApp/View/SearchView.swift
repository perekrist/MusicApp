//
//  SearchView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 28.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var resultViewModel = SearchSongsViewModel()
    var player: Player
    
    @State var isPlaying = false
    @State var item: Song?
    
    var body: some View {
        VStack {
            TextField("Search...", text: self.$resultViewModel.query)
                .padding()
            List(self.resultViewModel.songs) { song in
                PlayerItemView(song: song, player: self.player)
            }
            Spacer()
        }
        
        
    }
}
