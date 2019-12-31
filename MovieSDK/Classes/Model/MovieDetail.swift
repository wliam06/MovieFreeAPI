//
//  MovieDetail.swift
//  MovieSDK
//
//  Created by William on 26/12/19.
//

import Foundation

public class MovieDetailResponse: Codable {
  public let id: Int
  public let imdbId: String
  public let originalTitle: String
  public let originalLanguage: String
  public let adult: Bool
  public let backdropPath: String
  public let belongsToCollection: Belongs?
  public let budget: Int
  public let genres: Genres
  public let homepage: String
  public let overview: String
  public let popularity: Double
  public let posterPath: String
  public let productionCompanies: Companies?
  public let productionCountries: Countries?
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

  enum CodingKeys: String, CodingKey {
    case id, adult, budget, genres, homepage, overview, popularity, revenue, runtime, status, tagline, title, video
    case imdbId = "imdb_id"
    case originalTitle = "original_title"
    case originalLanguage = "original_language"
    case backdropPath = "backdrop_path"
    case belongsToCollection = "belongs_to_collection"
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountries = "production_countries"
    case releaseDate = "release_date"
    case spokenLanguages = "spoken_languages"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }

  // MARK: - Decode
  public required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    self.id = try container.decode(Int.self, forKey: .id)
    self.imdbId = try container.decode(String.self, forKey: .imdbId)
    self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
    self.originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
    self.adult = try container.decode(Bool.self, forKey: .adult)
    self.backdropPath = try container.decode(String.self, forKey: .backdropPath)
    self.belongsToCollection = try container.decodeIfPresent(Belongs.self, forKey: .belongsToCollection)
    self.budget = try container.decode(Int.self, forKey: .budget)
    self.genres = try container.decode(Genres.self, forKey: .genres)
    self.homepage = try container.decode(String.self, forKey: .homepage)
    self.overview = try container.decode(String.self, forKey: .overview)
    self.popularity = try container.decode(Double.self, forKey: .popularity)
    self.posterPath = try container.decode(String.self, forKey: .posterPath)
    self.productionCompanies = try container.decodeIfPresent(Companies.self, forKey: .productionCompanies)
    self.productionCountries = try container.decodeIfPresent(Countries.self, forKey: .productionCountries)
    self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
    self.revenue = try container.decode(Int.self, forKey: .revenue)
    self.runtime = try container.decode(Int.self, forKey: .runtime)
    self.spokenLanguages = try container.decode(Languages.self, forKey: .spokenLanguages)
    self.status = try container.decode(String.self, forKey: .status)
    self.tagline = try container.decode(String.self, forKey: .tagline)
    self.title = try container.decode(String.self, forKey: .title)
    self.video = try container.decode(Bool.self, forKey: .video)
    self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
    self.voteCount = try container.decode(Int.self, forKey: .voteCount)
  }
  
  // MARK: - Encode
  public func encode(to encode: Encoder) throws {
    var container = encode.container(keyedBy: CodingKeys.self)

    try container.encode(id, forKey: .id)
    try container.encode(imdbId, forKey: .imdbId)
    try container.encode(originalTitle, forKey: .originalTitle)
    try container.encode(originalLanguage, forKey: .originalLanguage)
    try container.encode(adult, forKey: .adult)
    try container.encode(backdropPath, forKey: .backdropPath)
    try container.encodeIfPresent(belongsToCollection, forKey: .belongsToCollection)
    try container.encode(budget, forKey: .budget)
    try container.encode(genres, forKey: .genres)
    try container.encode(homepage, forKey: .homepage)
    try container.encode(overview, forKey: .overview)
    try container.encode(popularity, forKey: .popularity)
    try container.encode(posterPath, forKey: .posterPath)
    try container.encodeIfPresent(productionCompanies, forKey: .productionCompanies)
    try container.encodeIfPresent(productionCountries, forKey: .productionCountries)
    try container.encode(releaseDate, forKey: .releaseDate)
    try container.encode(revenue, forKey: .revenue)
    try container.encode(runtime, forKey: .runtime)
    try container.encode(spokenLanguages, forKey: .spokenLanguages)
    try container.encode(status, forKey: .status)
    try container.encode(tagline, forKey: .tagline)
    try container.encode(title, forKey: .title)
    try container.encode(video, forKey: .video)
    try container.encode(voteAverage, forKey: .voteAverage)
    try container.encode(voteCount, forKey: .voteCount)
  }
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

public class Companies: Codable {
  public let id: Int
  public let logoPath: String?
  public let name: String
  public let originCountry: String

  enum CodingKeys: String, CodingKey {
    case id, name
    case logoPath = "logo_path"
    case originCountry = "origin_country"
  }

  // MARK: - Decode
  public required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    self.id = try container.decode(Int.self, forKey: .id)
    self.logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
    self.name = try container.decode(String.self, forKey: .name)
    self.originCountry = try container.decode(String.self, forKey: .originCountry)
  }

  // MARK: - Encode
  public func encode(to encode: Encoder) throws {
    var container = encode.container(keyedBy: CodingKeys.self)

    try container.encode(id, forKey: .id)
    try container.encodeIfPresent(logoPath, forKey: .logoPath)
    try container.encode(name, forKey: .name)
    try container.encode(originCountry, forKey: .originCountry)
  }
}

public struct Countries: Codable {
  public let iso31661: String
  public let name: String
}

public struct Languages: Codable {
  public let is06391: String
  public let name: String
}
