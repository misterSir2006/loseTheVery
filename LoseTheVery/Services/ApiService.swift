//
//  ApiService.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit

class ApiService {
    
    static func getRecordsRequest(offset: String, completionHandler: @escaping (LtvModel.Words) -> Void) {
        let url = URL(string: "https://api.airtable.com/v0/appHLMobCaTLuVQQy/Data?api_key=keyoFYTwLB0vomKLC&offset=\(offset)")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in            
            guard let data = data,
                  let queries = try? JSONDecoder().decode(LtvModel.Words.self, from: data)
            else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            completionHandler(queries)
        }.resume()
    }
}
