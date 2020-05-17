//
//  Song.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 17.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

struct Song: Identifiable {
    var id: UUID
    var trackViewUrl: String
    var trackName: String
    var artworkUrl100: String
    var artworkUrl60: String
    var trackTimeMillis: Int
    var artistName: String
    var previewUrl: String
}
