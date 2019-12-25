//
//  MovieServicePath.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

public enum MovieListPath: String {
  case latest
  case nowPlaying = "now playing"
  case popular
  case topRated = "top rated"
  case upcoming

  var path: String {
    switch self {
    case .latest:
      return "movie/latest"
    case .nowPlaying:
      return "movie/now_playing"
    case .popular:
      return "movie/popular"
    case .topRated:
      return "movie/top_rated"
    case .upcoming:
      return "movie/upcoming"
    }
  }

  // path is equal
  static func == (lhs: MovieListPath?, rhs: MovieListPath) -> Bool {
    guard let lhs = lhs else { return false }

    return lhs == lhs
  }
}
