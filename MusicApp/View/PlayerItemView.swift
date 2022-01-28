//
//  PlayerItemView.swift
//  MusicApp
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase
import FirebaseFirestore

struct PlayerItemView: View {
  
  var song: Song
  @State var isPlaying = false
  var player: Player
  @State var isDownloaded = false
  @State var showSheet = false
  
  @ObservedObject var songsViewModel = SongsViewModel()
  
  init(song: Song, player: Player) {
    self.song = song
    self.player = player
  }
  
  var body: some View {
    ZStack {
      HStack {
        HStack {
          ZStack {
            Image("album")
              .resizable()
              .frame(width: 60, height: 60)
              .cornerRadius(15)
              .padding()
            
            WebImage(url: URL(string: self.song.artworkUrl60))
              .resizable()
              .frame(width: 60, height: 60)
              .cornerRadius(15)
              .padding()
          }
          
          VStack {
            HStack {
              Text(self.song.trackName)
                .font(.callout)
                .lineLimit(2)
              Spacer()
            }
            
            HStack {
              Text(self.song.artistName)
                .font(.body)
                .foregroundColor(.gray)
              Spacer()
            }
          }
          
          Spacer()
          
          Text("\(self.song.trackTimeMillis / 60000):\(self.song.trackTimeMillis / 1000 - Int(self.song.trackTimeMillis / 60000)*60)")
            .font(.system(size: 15))
            .padding()
        }
        .onTapGesture {
          self.player.start(url: URL(string: self.song.previewUrl)!)
          self.showSheet = true
        }
        
        if !isDownloaded {
          Image(systemName: "plus")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.gray)
            .padding()
            .onTapGesture {
              self.songsViewModel.addToMyMusic(song: song)
              self.isDownloaded = true
            }
        }
        
      }
    }
    .sheet(isPresented: $showSheet) {
      PlayerView(song: song, player: self.player)
    }
  }
}
