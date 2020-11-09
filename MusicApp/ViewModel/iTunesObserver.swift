//
//  iTunesObserver.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 19.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import Alamofire

class iTunesService: ObservableObject {
    
    private var timer: Timer?
    let baseUrl = "https://itunes.apple.com/"
    
    @Published var results: [Song] = [Song]()
    @Published var query = ""  {
        didSet {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (_) in
                self.search(query: self.query)
            })
        }
    }
  
  func search(query: String) {
    results.removeAll()
    var newQuery = ""
    for q in query {
        if q == " " {
            newQuery.append("+")
        } else {
            newQuery.append(q)
        }
    }
    let url = baseUrl + "search?term=" + newQuery
    AF.request(url, method: .get).response { response in
      print(url)
      switch response.result {
      case .success(let data):
        guard let data = data else { return }
        let decoder = JSONDecoder()
        let songsResponse = try! decoder.decode(SongResponse.self, from: data)
        self.results = songsResponse.results
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
