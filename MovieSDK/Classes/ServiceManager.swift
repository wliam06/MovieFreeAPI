//
//  ServiceManager.swift
//  MovieSDK
//
//  Created by William on 13/12/19.
//

import Foundation

public class ServiceManager {
  private let session: ServiceSession
  private static var sharedInstance: ServiceManager?

  public static var header = ["Content-Type": "application/json"]

  /// Initialize ServiceSession
  init(session: ServiceSession = URLSession.shared) {
    self.session = session
  }

  func load(apiKey: String, method: HTTPMethod, body: [String: Any]? = nil,
            completion: @escaping(Any?, ServiceError?) -> Void) {
    guard let url = URL(string: Constants.baseURL + apiKey) else {
      #if DEBUG
      debugPrint("Invalid load url")
      #endif
      return
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.allHTTPHeaderFields = ServiceManager.header

    if let body = body {
      urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    }

    session.load(url: urlRequest) { (data, response, error) in
      var serviceErrorType = ServiceErrorType.network

      // Check data is exist or nil
      guard let data = data, error == nil else {
        completion(nil, ServiceError(type: serviceErrorType))
        return
      }

      do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        if let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode != 200, httpResponse.statusCode != 201 {
          if let message = ((json as? [String: Any])?["errors"] as? [String])?.first {
            serviceErrorType = .err(message: message)
          } else {
            serviceErrorType = .err(message: Constants.unexpectedError)
          }

          completion(json, ServiceError(type: serviceErrorType))
          return
        }

        completion(json, nil)
      } catch {
        serviceErrorType = .invalid
        completion(nil, ServiceError(type: serviceErrorType))
      }
    }
  }
}
