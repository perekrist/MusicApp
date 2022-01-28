//
//  MyMusicView.swift
//  MusicApp
//

import SwiftUI

struct MyMusicView: View {
  @ObservedObject private var firebaseService = FirebaseService()
  var player: Player
  
  var body: some View {
    ZStack {
      if firebaseService.songs.count != 0 {
        List(firebaseService.songs) { song in
          PlayerItemView(song: song, player: self.player)
        }
      } else {
        Text("No music!")
      }
    }.onAppear {
      firebaseService.loadSongs()
    }
  }
}
