//
//  PlayerView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 28.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct PlayerView : View {
    
    var item: Result
    
    @State var opacity : Double = 1
    @State var height : CGFloat = 0
    @State var floating = false
     
    var body : some View {
        GeometryReader { geo in
            ZStack {
                Color.orange
                VStack {
                    HStack {
                        
                        Image("taylor").resizable().frame(width: 60, height: 45).cornerRadius(10)
                        
                        VStack(alignment : .leading) {
                            Text("Love Story").fontWeight(.heavy)
                            Text("Taylor Swift")
                        }
                        
                        Spacer()
                        
                        Image(systemName: (self.height == geo.size.height - 75) ? "play.fill" :  "square.and.arrow.down.fill").resizable().frame(width: 32, height: 30)
                    }
                    .padding(10)
                    .foregroundColor(.white)
                    
                    // your music player.....
                    
                    Spacer()
                    
                }
            }
            .gesture(DragGesture()
            .onChanged({ (value) in
                    if self.height >= 0 {
                        
                        self.height += value.translation.height / 8
                        self.opacity = 0.5
                    }
                })
            .onEnded({ (value) in
                    if self.height > 100 && !self.floating {
                        
                        self.height = geo.size.height - 75
                        self.opacity = 1
                        self.floating = true
                    } else {
                        if self.height < geo.size.height - 150 {
                            
                            self.height = 0
                            self.opacity = 1
                            self.floating = false
                        } else {
                            self.height = geo.size.height - 75
                            self.opacity = 1
                        }
                    }
                })
            ).opacity(self.opacity)
            .offset(y: self.height)
            .animation(.spring())
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(item: Result(discNumber: 0, trackCount: 0, collectionCensoredName: "", artistViewUrl: "", currency: "", collectionExplicitness: "", trackId: 0, trackNumber: 0, trackPrice: 0, trackViewUrl: "", isStreamable: true, primaryGenreName: "Jazz", artworkUrl100: "", country: "USA", trackName: "Track Name", artistId: 0, wrapperType: "", collectionPrice: 0, artworkUrl60: "", releaseDate: "", trackCensoredName: "", trackTimeMillis: 0, collectionId: 0, artistName: "Jack Jonson", discCount: 0, collectionName: "", previewUrl: "", artworkUrl30: "", kind: "", trackExplicitness: ""))
    }
}
