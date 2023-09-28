//
//  UrlBuilder.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 23.02.2023.
//

import Foundation

final class UrlBuilder {
    
    static func buildWordsUrl(offset: String?) -> String {
        let baseUrl = Constants.Content.URLs.wordsApiUrl
        let apiKey = Constants.Content.ApiKeys.wordsApiKey
        
        let string = "\(baseUrl)?api_key=\(apiKey)&offset=\(offset ?? "")"
        
        return string
    }
    
    static func buildDictionaryUrl(word: String?) -> String {
        let baseUrl = Constants.Content.URLs.dictionaryUrl
        
        let string = "\(baseUrl)/\(word ?? " ")"
        
        return string
    }
    
    static func buildSuggestionUrl() -> String {
        let baseUrl = Constants.Content.URLs.suggestionUrl
        let key = Constants.Content.ApiKeys.suggestionKey
        
        let string = "\(baseUrl)/\(key)"
        
        return string
    }
}
