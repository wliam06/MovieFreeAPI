//
//  MovieDetail.swift
//  MovieSDK
//
//  Created by William on 26/12/19.
//

import Foundation

public struct MovieDetailResponse: Codable {
  public let id: Int
  public let imdbID: String
  public let originalTitle: String
  public let originalLanguage: String
  public let adult: Bool
  public let backdropPath: String
  public let belongsToCollection: Belongs
  public let budget: Int
  public let genres: Genres
  public let homepage: String
  public let overview: String
  public let popularity: Double
  public let posterPath: String
  public let productionCompanies: Companies
  public let productionCountries: Countries
  public let releaseDate: String
  public let revenue: Int
  public let runtime: Int
  public let spokenLanguages: Languages
  public let status: String
  public let tagline: String
  public let title: String
  public let video: Bool
  public let voteAverage: Double
  public let voteCount: Int
}

public struct Belongs: Codable {
  public let id: Int
  public let name: String
  public let posterPath: String
  public let backdropPath: String
}

public struct Genres: Codable {
  public let id: Int
  public let name: String
}

public struct Companies: Codable {
  public let id: Int
  public let logoPath: String
  public let name: String
  public let originCountry: String
}

public struct Countries: Codable {
  public let iso31661: String
  public let name: String
}

public struct Languages: Codable {
  public let is06391: String
  public let name: String
}
