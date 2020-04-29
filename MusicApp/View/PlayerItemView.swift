//
//  PlayerItemView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 29.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlayerItemView: View {
    
    var item: ItemViewModel
    var player: Player
    @State var time: Double = 0
    @State var volume: Double = 0
    @State var isPlaying: Bool = true
    
    var body: some View {
        VStack {
            
            Button(action: {
                
            }) {
                Image(systemName: "chevron.compact.down")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .padding()
            }
            
            ZStack {
                Image("artist")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(10)
                    .padding()
                
                WebImage(url: URL(string: item.artworkUrl100))
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(10)
                    .padding()
            }.padding(.top, 20)
            
            Slider(value: $time, in: 0...Double(item.trackTimeMillis/1000), step: 1.0)
                .padding()
            
            Text(item.trackName)
                .font(.system(size: 25))
                .bold()
            
            Button(action: {
                
            }) {
                Text(item.artistName)
                    .font(.system(size: 30))
                    .padding()
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "backward.fill")
                        .renderingMode(.original)
                        .font(.system(size: 30))
                        .padding()
                }
                
                Button(action: {
                    self.isPlaying.toggle()
                    
                    if !self.isPlaying {
                        self.player.stop()
                    } else {
                        self.player.start(url: self.item.previewUrl)
                    }
                }) {
                    Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
                        .renderingMode(.original)
                        .font(.system(size: 50))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "forward.fill")
                        .renderingMode(.original)
                        .font(.system(size: 30))
                        .padding()
                }
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "speaker.fill")
                    .foregroundColor(.gray)
                    .padding()
                
                Slider(value: $volume, in: -5...5, step: 0.1)
                    .padding()
                
                Image(systemName: "speaker.3.fill")
                    .foregroundColor(.gray)
                    .padding()
            }
            
        }
    }
}

struct PlayerItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerItemView(item: ItemViewModel(trackViewUrl: "", trackName: "when the party's over", artworkUrl100: "", trackTimeMillis: 10000, artistName: "Billie Eilish", previewUrl: ""), player: Player())
    }
}
