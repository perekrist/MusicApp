//
//  FirebaseService.swift
//  MusicApp
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseService: ObservableObject {
  @Published var songs = [Song]()
  
  private var db = Firestore.firestore()
  private var userId: String? {
    return Auth.auth().currentUser?.uid
  }
  
  func loadSongs() {
    guard let userId = userId else { return }
    db.collection(userId).addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }
      
      self.songs = documents.map { queryDocumentSnapshot -> Song in
        let data = queryDocumentSnapshot
        
        let trackId = data["trackId"] as? Int ?? 0
        let trackViewUrl = data["trackViewUrl"] as? String ?? ""
        let trackName = data["trackName"] as? String ?? ""
        let artworkUrl100 = data["artworkUrl100"] as? String ?? ""
        let artworkUrl60 = data["artworkUrl60"] as? String ?? ""
        let trackTimeMillis = data["trackTimeMillis"] as? Int ?? 0
        let artistName = data["artistName"] as? String ?? ""
        let previewUrl = data["previewUrl"] as? String ?? ""
        
        return Song(trackId: trackId,
                    trackViewUrl: trackViewUrl,
                    trackName: trackName,
                    artworkUrl100: artworkUrl100,
                    artworkUrl60: artworkUrl60,
                    trackTimeMillis: trackTimeMillis,
                    artistName: artistName,
                    previewUrl: previewUrl)
      }
    }
  }
  
  func addToMyMusic(song: Song) {
    guard let userId = userId else { return }
    db.collection(userId).document()
      .setData([
        "trackId": song.trackId,
        "trackViewUrl": song.trackViewUrl,
        "trackName": song.trackName,
        "artworkUrl100": song.artworkUrl100,
        "artworkUrl60": song.artworkUrl60,
        "trackTimeMillis": song.trackTimeMillis,
        "artistName": song.artistName,
        "previewUrl": song.previewUrl
      ]) { error in
        guard error != nil else {
          print(error?.localizedDescription)
          return
        }
        print("success")
      }
  }
}
