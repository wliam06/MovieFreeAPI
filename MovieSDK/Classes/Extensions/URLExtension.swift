//
//  URLExtension.swift
//  MovieSDK
//
//  Created by William on 15/12/19.
//

import Foundation

extension URL {
  func appending(_ queryItems: [String: String], value: String) -> URL? {
    var urlComponents = URLComponents(string: value)

    var items: [URLQueryItem] = urlComponents?.queryItems ?? []
    var queryItem: URLQueryItem!

    for item in queryItems {
      debugPrint("ITEMS", item.key)
      debugPrint("VALUE", item.value)
      queryItem = URLQueryItem(name: item.key, value: item.value)
      items.append(queryItem)
    }

//    items.append(queryItem)
    urlComponents?.queryItems = items
//    urlComponents?.queryItems = queryItems.map({ element in URLQueryItem(name: element.key, value: element.value) })
    return urlComponents?.url
  }
}
