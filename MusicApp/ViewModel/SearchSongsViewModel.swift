//
//  SearchSongsViewModel.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 09.11.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import SwiftUI

class SearchSongsViewModel: ObservableObject {
  @Published var songs: [Song] = []
  @Published var query = ""  {
      didSet {
          timer?.invalidate()
          timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (_) in
              self.search(query: self.query)
          })
      }
  }
  private var timer: Timer?
  private var songsService: iTunesService = iTunesService()
  
  func search(query: String) {
    self.songsService.search(query: query)
    self.songsService.onDidFinishRequest = { [weak self] songs in
      self?.songs = songs
    }
  }
}
