//
//  MovieSession.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

open class MovieSession {
  public init() {}

  deinit {
    #if DEBUG
    debugPrint(String(describing: self), " deinit")
    #endif
  }

  /// List of Movie (Latest, Now Playing, Popular, Top Rated, Upcoming)
  /// - Parameter movieList: Choose list of movie
  /// - Parameter onComplete: Movie Response
  /// - Parameter onFailure: Invalid Movie Response
  open func movieList(movieList: MovieListPath, onComplete: onComplete?, onFailure: onFailure?) {

    ServiceManager.api.load(urlPath: movieList.path, method: .GET) { (data, error) in
      if let error = error {
        onFailure?(error)
        return
      }

      onComplete?(data)
    }
  }

}
