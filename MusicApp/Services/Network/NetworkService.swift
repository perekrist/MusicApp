//
//  NetworkService.swift
//  MusicApp
//

import Foundation

class NetworkService {
  private let baseURL = "https://itunes.apple.com"
  
  func search(query: String) async throws -> [Song] {
    let urlString = "/search?term=" + query.replacingOccurrences(of: " ", with: "+")
    let response: SongsResponse = try await baseRequest(urlString: urlString)
    return response.results
  }
}

enum CustomError: Error {
  case invalidURL
}

extension NetworkService {
  private func baseRequest<T: Codable>(urlString: String, method: String = "GET") async throws -> T {
    guard let url = URL(string: baseURL + urlString) else { throw CustomError.invalidURL }
    var request = URLRequest(url: url)
    request.httpMethod = method
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      return try decoder.decode(T.self, from: data)
    } catch (let error) {
      print(url.absoluteString)
      print(error)
      throw error
    }
  }
}
