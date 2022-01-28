//
//  iTunesObserver.swift
//  MusicApp
//

import Foundation

class iTunesObserver: ObservableObject {
  
  private var timer: Timer?
  private let baseUrl = "https://itunes.apple.com/"
  
  @Published private(set) var results: [Song] = [Song]()
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
    let urlString = baseUrl + "search?term=" + query.replacingOccurrences(of: " ", with: "+")
//    AF.request(url, method: .get).responseJSON { (data) in
//      let json = try! JSON(data: data.data!)
//      let results_ = json["results"]
//      for i in results_ {
//        self.results.append(Song(id: UUID(),
//                                 trackViewUrl: i.1["trackViewUrl"].stringValue,
//                                 trackName: i.1["trackName"].stringValue,
//                                 artworkUrl100: i.1["artworkUrl100"].stringValue,
//                                 artworkUrl60: i.1["artworkUrl60"].stringValue,
//                                 trackTimeMillis: i.1["trackTimeMillis"].intValue,
//                                 artistName: i.1["artistName"].stringValue,
//                                 previewUrl: i.1["previewUrl"].stringValue
//                                ))
//      }
//    }
  }
}
