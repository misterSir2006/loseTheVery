//
//  ApiService.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit

final class ApiService {
    
    enum NetworkMethods: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    // MARK: Main function
    static func get<T: Codable>(for: T.Type = T.self,
                                offset: String?,
                                method: NetworkMethods,
                                completionHandler: @escaping (Result<T, ApiError>) -> Void) {
        
        let urlStr = UrlBuilder.buildWordsUrl(offset: offset)
        guard let url = URL(string: urlStr) else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil else {
                completionHandler(.failure(.httpError))
                return
            }
            
            if let decodedData = try? JSONDecoder().decode(T.self, from: data!) {
                DispatchQueue.main.async {
                    completionHandler(.success(decodedData))
                }
            } else {
                let error = try? JSONDecoder().decode(ApiErrorObject.self, from: data!)
                guard let error = error else { return }
                completionHandler(.failure(.serviceError(error)))
            }
        }.resume()
    }
    
    // MARK: Error object
    struct ApiErrorObject: Codable {
        var error: ApiErrorData
        
        struct ApiErrorData: Codable {
            var type: String
            var message: String
        }
    }

    enum ApiError: Error {
        case serviceError(ApiErrorObject)
        case httpError
    }
}
