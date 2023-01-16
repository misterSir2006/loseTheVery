//
//  LTVPresenter.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit

class LtvPresenter {
    
    var records: LtvModel.Words?
    
    var recordsArray: [LtvModel.Record] = []
    var offset = ""
    
//    func collectWords() {
//        DispatchQueue.global(qos: .userInitiated).async {
//            ApiService.getRecordsRequest(offset: "") { result in
//                self.recordsArray = result.records
//                print("1")
//            }
//        }
//    }
    
    func getRecords(simpleTextField: UITextField) {
        DispatchQueue.global(qos: .userInitiated).async {
            ApiService.getRecordsRequest(offset: "") { result in
                self.recordsArray = result.records
                
                DispatchQueue.main.async { [self] in
                    if let re = recordsArray.randomElement() {
                        simpleTextField.placeholder = re.fields.Simple
                    }
                }
                
            }
        }
    }
}
