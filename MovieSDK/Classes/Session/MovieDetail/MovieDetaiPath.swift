//
//  MovieDetaiPath.swift
//  MovieSDK
//
//  Created by William on 26/12/19.
//

import Foundation

public enum MovieDetailPath {
  case movieDetail(movieID: Int)

  var path: String {
    switch self {
    case .movieDetail(let movieID):
      return "movie/\(movieID)"
    }
  }
}
