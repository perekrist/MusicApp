//
//  SearchView.swift
//  MusicApp
//

import SwiftUI

struct SearchView: View {
  @ObservedObject private var viewModel = SearchViewModel()
  
  var player: Player
  @State var isPlaying = false
  @State var item: Song?
  
  var body: some View {
    VStack {
      TextField("Search...", text: $viewModel.query)
        .padding()
      
      List(viewModel.songs) { song in
        PlayerItemView(song: song, player: self.player)
      }
      Spacer()
    }
  }
}
