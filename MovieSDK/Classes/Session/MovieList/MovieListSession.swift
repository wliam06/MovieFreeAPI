//
//  MovieSession.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

open class MovieListSession {
  public init() {}

  /// Get the most newly created movie
  /// - Parameter completion: Movie Response contains success and failed response
  open func latestMovie(completion: @escaping CompletionHandler) {
    ServiceManager.api.load(urlPath: MovieListPath.latest.path, method: .GET) { (data, error) in
      if let error = error {
        completion(.failure(error))
        return
      }

//      completion(.success(data))
    }
  }

  /// Get List of Movies in theatres (Latest, Now Playing, Popular, Top Rated, Upcoming)
  /// - Parameter completion: Movie Response contains success and failed response
  open func listOfMove(movie: MovieListPath, page: String = "1", language: String = "en-US",
                       completion: @escaping CompletionHandler) {
    let param: [String: String] = ["language": language, "page": page]

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

        if let dict = movieResponse.dictionary {
          completion(.success(dict))
        }
      } catch {
        completion(.failure(ServiceError(type: .invalid)))
      }
    }
  } 
}
