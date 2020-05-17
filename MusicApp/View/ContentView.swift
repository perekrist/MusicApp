//
//  ContentView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 19.04.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var player = Player()
    
    var body: some View {
        
        VStack {
            if status {
                NavigationView {
                    TabView {
                        SearchView(player: player).tabItem {
                            VStack {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        }
                        MyMusicView(player: player).tabItem {
                            VStack {
                                Image(systemName: "music.note.list")
                                Text("My music")
                            }
                        }
                    }.navigationBarItems(trailing:
                        Button(action: {
                            try! Auth.auth().signOut()
                            UserDefaults.standard.set(false, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                        }) {
                            Text("LogOut")
                                .foregroundColor(.gray)
                        }
                    )
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }.accentColor(.gray)
            } else {
                LoginView(status: self.status)
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
