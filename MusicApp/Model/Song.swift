//
//  Song.swift
//  MusicApp
//

import Foundation

struct Song: Identifiable, Codable {
  var id: UUID
  var trackViewUrl: String
  var trackName: String
  var artworkUrl100: String
  var artworkUrl60: String
  var trackTimeMillis: Int
  var artistName: String
  var previewUrl: String
}
