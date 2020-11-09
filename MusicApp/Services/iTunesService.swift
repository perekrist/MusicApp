//
//  iTunesService.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 19.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import Alamofire

class iTunesService {
  private let baseUrl = "https://itunes.apple.com/"
  var onDidFinishRequest: (([Song]) -> Void)?
  
  func search(query: String) {
    let newQuery = query.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
    let url = baseUrl + "search?term=" + newQuery
    AF.request(url, method: .get).response { response in
      switch response.result {
      case .success(let data):
        guard let data = data else { return }
        let decoder = JSONDecoder()
        let songsResponse = try! decoder.decode(SongResponse.self, from: data)
        self.onDidFinishRequest?(songsResponse.results)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}