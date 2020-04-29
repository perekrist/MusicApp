//
//  ListItemViewModel.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 29.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

struct ListItemViewModel: Hashable {
    var trackViewUrl: String
    var trackName: String
    var artworkUrl60: String
    var trackTimeMillis: Int
    var artistName: String
    var previewUrl: String
}
