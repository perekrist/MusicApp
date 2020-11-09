//
//  FirebaseService.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 09.11.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseService: ObservableObject {
    
    private var db = Firestore.firestore()
    let userId = Auth.auth().currentUser!.uid
    
    func fetchData() -> [Song] {
        db.collection(userId).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
//            self.songs = documents.map { queryDocumentSnapshot -> Song in
//                let data = queryDocumentSnapshot
//
//                let trackViewUrl = data["trackViewUrl"] as? String ?? ""
//                let trackName = data["trackName"] as? String ?? ""
//                let artworkUrl100 = data["artworkUrl100"] as? String ?? ""
//                let artworkUrl60 = data["artworkUrl60"] as? String ?? ""
//                let trackTimeMillis = data["trackTimeMillis"] as? Int ?? 0
//                let artistName = data["artistName"] as? String ?? ""
//                let previewUrl = data["previewUrl"] as? String ?? ""
//
//              return Song(from: Decoder(id: UUID(), trackViewUrl: trackViewUrl, trackName: trackName, artworkUrl100: artworkUrl100, artworkUrl60: artworkUrl60, trackTimeMillis: trackTimeMillis, artistName: artistName, previewUrl: previewUrl))
//            }
        }
      return []
    }
    
    func addToMyMusic(song: Song) {
        let db = Firestore.firestore()
        db.collection(userId).document()
            .setData([
                "trackViewUrl": song.trackViewUrl,
                "trackName": song.trackName,
                "artworkUrl100": song.artworkUrl100,
                "artworkUrl60": song.artworkUrl60,
                "trackTimeMillis": song.trackTimeMillis,
                "artistName": song.artistName,
                "previewUrl": song.previewUrl
            ]) { (err) in
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                print("success")
        }
        
    }
    
    
}
