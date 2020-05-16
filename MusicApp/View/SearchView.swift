//
//  SearchView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 28.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var obs = iTunesObserver()
    var player = Player()
    
    @State var isPlaying = false
    @State var item: Result?
    
    var body: some View {
        ZStack {
            List {
                VStack {
                    TextField("Search...", text: self.$obs.query)
                    if self.obs.results.count != 0 {
                        ForEach(self.obs.results, id: \.self) { i in
                            PlayerItemView(item: i, player: self.player)
                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
