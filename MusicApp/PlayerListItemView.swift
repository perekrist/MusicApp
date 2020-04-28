//
//  PlayerListItemView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 28.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlayerListItemView: View {
    
    var item: Result
    @State var isPlaying = false
    var player: Player
    
    init(item: Result, player: Player) {
        self.item = item
        self.player = player
    }
    
    var body: some View {
        HStack {
            
            ZStack {
                Image("album")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(20)
                    .padding(10)
                
                WebImage(url: URL(string: self.item.artworkUrl60))
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(20)
                    .padding(10)
            }
            
            VStack {
                HStack {
                    Text(self.item.trackName)
                        .font(.callout)
                        .lineLimit(2)
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
            
            Text("\(self.item.trackTimeMillis / 60000):\(self.item.trackTimeMillis / 1000 - Int(self.item.trackTimeMillis / 60000)*60)")
                .font(.system(size: 15))
            .padding()
            
        }.onTapGesture {
            self.isPlaying.toggle()
            
            if self.isPlaying {
                self.player.start(url: self.item.previewUrl)
            } else {
                self.player.stop()
            }
            
        }
    }
}

struct PlayerListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListItemView(item: Result(discNumber: 0, trackCount: 0, collectionCensoredName: "", artistViewUrl: "", currency: "", collectionExplicitness: "", trackId: 0, trackNumber: 0, trackPrice: 0, trackViewUrl: "", isStreamable: true, primaryGenreName: "Jazz", artworkUrl100: "", country: "USA", trackName: "Track Name", artistId: 0, wrapperType: "", collectionPrice: 0, artworkUrl60: "", releaseDate: "", trackCensoredName: "", trackTimeMillis: 0, collectionId: 0, artistName: "Jack Jonson", discCount: 0, collectionName: "", previewUrl: "", artworkUrl30: "", kind: "", trackExplicitness: ""), player: Player())
            .previewLayout(.sizeThatFits)
    }
}
