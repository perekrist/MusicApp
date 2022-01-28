//
//  SearchViewModel.swift
//  MusicApp
//

import SwiftUI

@MainActor
class SearchViewModel: ObservableObject {
  private var timer: Timer?
  private let networkService = NetworkService()
  
  @Published private(set) var songs = [Song]()
  @Published var query = ""  {
    didSet {
      timer?.invalidate()
      timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { _ in
        Task {
          await self.search()
        }
      })
    }
  }
  
  func search() async {
    do {
      songs = try await networkService.search(query: query)
    } catch (let error) {
      print(error.localizedDescription)
    }
  }
}
