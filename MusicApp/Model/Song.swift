//
//  Song.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 17.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

struct Song: Identifiable, Codable {
  let id: UUID
  let trackViewUrl: String
  let trackName: String
  let artworkUrl100: String
  let artworkUrl60: String
  let trackTimeMillis: Int
  let artistName: String
  let previewUrl: String
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
    trackViewUrl = try container.decodeIfPresent(String.self, forKey: .trackViewUrl) ?? ""
    trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
    artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
    artworkUrl60 = try container.decodeIfPresent(String.self, forKey: .artworkUrl60) ?? ""
    artistName = try container.decodeIfPresent(String.self, forKey: .artistName) ?? ""
    previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl) ?? ""
    trackTimeMillis = try container.decodeIfPresent(Int.self, forKey: .trackTimeMillis) ?? 0
  }
}

struct SongResponse: Codable {
  let results: [Song]
}
