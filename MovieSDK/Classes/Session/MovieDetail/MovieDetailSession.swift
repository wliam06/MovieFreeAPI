//
//  MovieDetailSession.swift
//  MovieSDK
//
//  Created by William on 26/12/19.
//

import Foundation

open class MovieDetailSession {
  public init() {}

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
        let jsonSerialize = try JSONSerialization.jsonObject(with: data, options: [])
        debugPrint("JSON SERIALIZE", jsonSerialize)
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
