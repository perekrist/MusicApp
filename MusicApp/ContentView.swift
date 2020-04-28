//
//  ContentView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 19.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var obs = iTunesObserver()
    var player = Player()
    
    @State var isPlaying = false
    var item: Result?
    
    var body: some View {
        List {
            VStack {
                TextField("Search...", text: self.$obs.query)
                if self.obs.results.count != 0 {
                    ForEach(self.obs.results, id: \.self) { i in
                        PlayerListItemView(item: i, player: self.player)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
