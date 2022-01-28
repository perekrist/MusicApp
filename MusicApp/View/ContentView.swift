//
//  ContentView.swift
//  MusicApp
//

import SwiftUI
import Firebase

struct ContentView: View {
  @State private var showLogOut = false
  @State private var isLoggedIn = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool ?? false
  
  private var player = Player()
  
  var body: some View {
    
    VStack {
      if isLoggedIn {
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
            showLogOut.toggle()
          }) {
            Image(systemName: "person.3.fill")
              .foregroundColor(.gray)
          }).confirmationDialog("", isPresented: $showLogOut, titleVisibility: .hidden) {
            Button("LogOut") {
              do {
                try Auth.auth().signOut()
              } catch (let error) {
                print(error.localizedDescription)
              }
              UserDefaults.standard.set(false, forKey: "status")
              NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
          }
          .navigationBarTitle("")
          .navigationBarHidden(true)
        }.accentColor(.gray)
      } else {
        LoginView(isLoggedIn: self.isLoggedIn)
      }
    }
    .onAppear {
      NotificationCenter.default.addObserver(forName: NSNotification.Name("isLoggedIn"), object: nil, queue: .main) { _ in
        self.isLoggedIn = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool ?? false
      }
    }
  }
}
