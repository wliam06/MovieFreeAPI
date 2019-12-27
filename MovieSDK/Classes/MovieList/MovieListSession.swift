//
//  MovieSession.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

open class MovieListSession {
  public init() {}

  deinit {
    #if DEBUG
    debugPrint(String(describing: self) + " deinit")
    #endif
  }

  /// Get List of Movies in theatres (Latest, Now Playing, Popular, Top Rated, Upcoming)
  /// - Parameter movieList: Choose list of movie
  /// - Parameter onComplete: Movie Response
  /// - Parameter onFailure: Invalid Movie Response
  open func listOfMove(movie: MovieListPath, page: String = "1", language: String = "en-US",
                       region: String = "", completion: @escaping CompletionHandler) {
    let param: [String: String] = ["language": language, "page": page, "region": region]

    ServiceManager.api.load(urlPath: movie.path, queryItems: param, method: .GET, body: nil) { (data, error) in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else { return }
      let decoder = JSONDecoder()

      do {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let movieResponse = try decoder.decode(MoviesResponse.self, from: data)

        if let dict = movieResponse.dictionary as? [String: Any] {
          completion(.success(dict))
        }
      } catch {
        completion(.failure(ServiceError(type: .invalid)))
      }
    }
  }  
}
