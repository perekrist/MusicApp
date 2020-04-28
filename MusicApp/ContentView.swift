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
    
    var body: some View {
        List {
            VStack {
                TextField("Search...", text: self.$obs.query)
                if self.obs.results.count != 0 {
                    ForEach(self.obs.results, id: \.self) { i in
                       PlayerListItemView(item: i)
                    }
                }
            }
//        .onAppear {
//            self.obs.search(query: "jack johnson")
//        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
