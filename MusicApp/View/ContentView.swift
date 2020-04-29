//
//  ContentView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 19.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       TabView {
           SearchView().tabItem {
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
           }
           Text("My music").tabItem {
                VStack {
                    Image(systemName: "music.note.list")
                    Text("My music")
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
