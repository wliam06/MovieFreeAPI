//
//  MovieSession.swift
//  MovieSDK
//
//  Created by William on 05/01/20.
//

import Foundation

open class Movies {
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

  /// List of movies based on status ( Now Playing, Popular, Top Rated, Upcoming )
  /// - Parameter movie: Movie status
  /// - Parameter page (optional): Movie list of page, by default page is `1`
  /// - Parameter language (optional): Movie language description, by default language is `en-US`
  /// - Parameter completion: Movie response contains success and failed (error)
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

  /// Detail of Movie
   /// - Parameters:
   ///   - id: Movie id
   ///   - language (optional): Choose language based on region, ex: `en-us`
   ///   - completion: Movie response contains success and failed (error)
   open func detailOfMovie(withID id: Int, language: String = "en-US", completion: @escaping CompletionHandler) {
     let param: [String: String] = ["language": language]
     let path = MovieDetailPath.movieDetail(movieID: id).path
     ServiceManager.api.load(urlPath: path, queryItems: param, method: .GET, body: nil) { (data, error) in
       if let error = error {
         completion(.failure(error))
         return
       }

       guard let data = data else { return }

       let decoder = JSONDecoder()
       decoder.keyDecodingStrategy = .convertFromSnakeCase

       do {
         let movieDetailResponse = try decoder.decode(MovieDetailResponse.self, from: data)
         if let dict = movieDetailResponse.dictionary {
           completion(.success(dict))
         }
       } catch {
         completion(.failure(ServiceError(type: .invalid)))
       }
     }
   }

}
