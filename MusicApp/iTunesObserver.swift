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
    
    let baseUrl = "https://itunes.apple.com/"
    
    @Published var results: [Result] = [Result]()
    
    func search(query: String) {
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
                self.results.append(Result(discNumber: i.1["discNumber"].intValue,
                                      trackCount: i.1["trackCount"].intValue,
                                      collectionCensoredName: i.1["collectionCensoredName"].stringValue,
                    artistViewUrl: i.1["artistViewUrl"].stringValue,
                                      currency: i.1["currency"].stringValue,
                                      collectionExplicitness: i.1["collectionExplicitness"].stringValue,
                                      trackId: i.1["trackId"].intValue,
                                      trackNumber: i.1["trackNumber"].intValue,
                                      trackPrice: i.1["trackPrice"].intValue,
                                      trackViewUrl: i.1["trackViewUrl"].stringValue,
                                      isStreamable: i.1["isStreamable"].boolValue,
                                      primaryGenreName: i.1["primaryGenreName"].stringValue,
                                      artworkUrl100: i.1["artworkUrl100"].stringValue,
                                      country: i.1["country"].stringValue,
                                      trackName: i.1["trackName"].stringValue,
                                      artistId: i.1["artistId"].intValue,
                                      wrapperType: i.1["wrapperType"].stringValue,
                                      collectionPrice: i.1["collectionPrice"].intValue,
                                      artworkUrl60: i.1["artworkUrl60"].stringValue,
                                      releaseDate: i.1["releaseDate"].stringValue,
                                      trackCensoredName: i.1["trackCensoredName"].stringValue,
                                      trackTimeMillis: i.1["trackTimeMillis"].intValue,
                                      collectionId: i.1["collectionId"].intValue,
                                      artistName: i.1["artistName"].stringValue,
                                      discCount: i.1["discCount"].intValue,
                                      collectionName: i.1["collectionName"].stringValue,
                                      previewUrl: i.1["previewUrl"].stringValue,
                                      artworkUrl30: i.1["artworkUrl30"].stringValue,
                                      kind: i.1["kind"].stringValue,
                                      trackExplicitness: i.1["trackExplicitness"].stringValue)
                )
            }
        }
    }
}
