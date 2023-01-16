//
//  LTVModel.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import Foundation

class LtvModel {
    // MARK: - Words
    struct Words: Codable {
        let records: [Record]
        let offset: String?
    }

    // MARK: - Record
    struct Record: Codable {
        let id, createdTime: String
        let fields: Fields
    }

    // MARK: - Fields
    struct Fields: Codable {
        let Simple, Concise1: String
        let Concise2, Concise3, Concise4, Concise5: String?
        let Concise6, Concise7, Concise8, Concise9: String?
        
        enum CodingKeys: String, CodingKey {
            case Simple
            case Concise1
            case Concise2
            case Concise3
            case Concise4
            case Concise5
            case Concise6
            case Concise7
            case Concise8
            case Concise9
        }
    }
}
