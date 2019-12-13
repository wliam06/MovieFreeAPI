//
//  MovieServicePath.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

enum MovieListPath: Equatable {
  case latest
  case nowPlaying
  case popular
  case topRated
  case upcoming

  // path is equal
  static func == (lhs: MovieListPath?, rhs: MovieListPath) -> Bool {
    guard let lhs = lhs else { return false }

    return lhs == lhs
  }
}

public struct MoviePath {
  let path: String

  init(moviePath: MovieListPath) {
    switch moviePath {
    case .latest:
      path = "latest"
    case .nowPlaying:
      path = "now_playing"
    case .popular:
      path = "popular"
    case .topRated:
      path = "top_rated"
    case .upcoming:
      path = "upcoming"
    }
  }
}
