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

  // Get latest movie
  open func latestMovie() {
    
  }
  // Get upcoming movie
  // Get popular movie
  // Get topRated movie
  // Get upcoming movie
}
