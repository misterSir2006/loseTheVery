//
//  Constants.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit

struct Constants {
    
    struct Content {
        
        struct URLs {
            static let wordsApiUrl = "https://api.airtable.com/v0/appHLMobCaTLuVQQy/Data"
            static let dictionaryUrl = "https://www.dictionary.com/browse"
            static let suggestionUrl = "https://airtable.com"
        }
        
        struct ApiKeys {
            static let wordsApiKey = "keyoFYTwLB0vomKLC"
            static let suggestionKey = "shrUvhaGlGYSyarWT"
        }
        
    }
    
    //MARK: Design
    struct Design {
        
        struct Colors {
            static let greenColor = UIColor(red: 144/255, green: 210/255, blue: 147/255, alpha: 1)
            static let lightGrayColor = UIColor(red: 205/255, green: 212/255, blue: 223/255, alpha: 1)
        }
        
        struct Images {
            static let pencilIcon = UIImage(named: "pencilIcon")!
        }
    }
}
