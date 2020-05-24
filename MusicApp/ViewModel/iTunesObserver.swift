//
//  iTunesObserver.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 19.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class iTunesObserver: ObservableObject {
    
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
        AF.request(url, method: .get).responseJSON { (data) in
            let json = try! JSON(data: data.data!)
            let results_ = json["results"]
            for i in results_ {
                self.results.append(Song(id: UUID(),
                                         trackViewUrl: i.1["trackViewUrl"].stringValue,
                                         trackName: i.1["trackName"].stringValue,
                                         artworkUrl100: i.1["artworkUrl100"].stringValue,
                                         artworkUrl60: i.1["artworkUrl60"].stringValue,
                                         trackTimeMillis: i.1["trackTimeMillis"].intValue,
                                         artistName: i.1["artistName"].stringValue,
                                         previewUrl: i.1["previewUrl"].stringValue
                ))
            }
        }
    }
}
