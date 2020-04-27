//
//  PlayerListItemView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 28.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct PlayerListItemView: View {
    
    var item: Result
    @State var isPlaying = false
    var player: Player
    
    init(item: Result) {
        self.item = item
        player = Player(url: item.previewUrl)
        
    }
    
    var body: some View {
        HStack {
            
            Image("album")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(20)
                .padding()
            
            VStack {
                HStack {
                    Text(self.item.trackName)
                        .font(.title)
                    Spacer()
                }
                
                HStack {
                    Text(self.item.artistName)
                        .font(.body)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            
            Spacer()
            
            Text("\(self.item.trackTimeMillis / 60000):\(self.item.trackTimeMillis / 1000)")
                .font(.system(size: 15))
            .padding()
            
        }.onTapGesture {
            self.isPlaying.toggle()
            
            if self.isPlaying {
                self.player.start()
            } else {
                self.player.stop()
            }
            
        }
    }
}

struct PlayerListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListItemView(item: Result(discNumber: 0, trackCount: 0, collectionCensoredName: "", artistViewUrl: "", currency: "", collectionExplicitness: "", trackId: 0, trackNumber: 0, trackPrice: 0, trackViewUrl: "", isStreamable: true, primaryGenreName: "Jazz", artworkUrl100: "", country: "USA", trackName: "Track Name", artistId: 0, wrapperType: "", collectionPrice: 0, artworkUrl60: "", releaseDate: "", trackCensoredName: "", trackTimeMillis: 0, collectionId: 0, artistName: "Jack Jonson", discCount: 0, collectionName: "", previewUrl: "", artworkUrl30: "", kind: "", trackExplicitness: ""))
            .previewLayout(.sizeThatFits)
    }
}
