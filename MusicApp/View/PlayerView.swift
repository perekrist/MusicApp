//
//  PlayerView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 29.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlayerView: View {
    
    var song: Song
    var player: Player
    @State var time: Double = 0
    @State var volume: Double = 0
    @State var isPlaying: Bool = true
    
    var body: some View {
        ZStack {
            Color.init(UIColor.bg).edgesIgnoringSafeArea(.all)
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
                    .modifier(TopModifier())
                
                WebImage(url: URL(string: song.artworkUrl100))
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(10)
                    .padding()
                    .modifier(TopModifier())
            }.padding(.top, 20)
            
            Slider(value: $time, in: 0...Double(song.trackTimeMillis/1000), step: 1.0)
                .padding()
            
            Text(song.trackName)
                .font(.system(size: 25))
                .bold()
            
            Button(action: {
                
            }) {
                Text(song.artistName)
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
                        .padding(20)
                }.buttonStyle(OthersModifier())
                
                Button(action: {
                    self.isPlaying.toggle()
                    
                    if !self.isPlaying {
                        self.player.pause()
                    } else {
                        self.player.play()
                    }
                }) {
                    Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
                        .renderingMode(.original)
                        .font(.system(size: 50))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                }.buttonStyle(OthersModifier())
                
                Button(action: {
                    
                }) {
                    Image(systemName: "forward.fill")
                        .renderingMode(.original)
                        .font(.system(size: 30))
                        .padding(20)
                }.buttonStyle(OthersModifier())
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
}
