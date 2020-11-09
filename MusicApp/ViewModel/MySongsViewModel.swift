//
//  MySongsViewModel.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 17.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import SwiftUI

class MySongsViewModel: ObservableObject {
  @ObservedObject private var dbService = FirebaseService()
  @Published var songs: [Song] = []
  
  func getSongs() {
    self.songs = dbService.fetchData()
  }
  
  func addSong(song: Song) {
    dbService.addToMyMusic(song: song)
  }
}
