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
        let fields: [String: String]
    }

}
