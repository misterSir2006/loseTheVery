//
//  LTVPresenter.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit

class LtvPresenter {
    
    // MARK: Get Videos
    var recordsArray: [LtvModel.Record] = []
    
    func getVideos(offset: String?, completion: @escaping () -> Void) {
        ApiService.get(for: LtvModel.Words.self,
                       offset: offset,
                       method: .get) { result in
            switch result {
            case .success(let data):
                self.recordsArray += data.records
                
                if data.offset != nil {
                    self.getVideos(offset: data.offset, completion: completion)
                } else {
                    print(self.recordsArray)
                    completion()
                }
            case .failure(let error):
                switch error {
                case .httpError:
                    break
                case .serviceError(_):
                    break
                }
            }
        }
    }
    
    // MARK: Words operations
    enum AppState {
        case firstSetup
        case buttonClick
    }
    
    func setRandomElement(data: [LtvModel.Record],
                          simpleTextField: UITextField,
                          conciseButton: UIButton,
                          state: AppState) {
        guard let randomElement = data.randomElement()?.fields else { return }
        let randomConcise = randomElement
                                .filter{ $0.key != "Simple" && $0.key != "id" }
                                .randomElement()
        
        if state == .buttonClick {
            simpleTextField.text = randomElement["Simple"]
        }
        
        simpleTextField.placeholder = randomElement["Simple"]
        conciseButton.setTitle(randomConcise?.value, for: .normal)
    }
    
    func searchForWord(data: [LtvModel.Record],
                       simpleTextField: UITextField,
                       conciseButton: UIButton) {
        
        guard let text = simpleTextField.text,
                         !text.isEmpty else {
            
            conciseButton.setTitleColor(.red, for: .normal)
            conciseButton.setTitle("No input", for: .normal)
            return
        }
        
        let word = data.filter { $0.fields["Simple"] == text.trimmingCharacters(in: .whitespaces) }
        
        if !word.isEmpty {
            if let randomConcise = word[0].fields
                                        .filter({ $0.key != "Simple" && $0.key != "id" && $0.value != conciseButton.titleLabel?.text })
                                        .randomElement()?.value {
                DispatchQueue.main.async {
                    conciseButton.setTitleColor(Constants.Design.Colors.greenColor, for: .normal)
                    conciseButton.setTitle(randomConcise, for: .normal)
                }
            }
        } else {
            DispatchQueue.main.async {
                conciseButton.setTitleColor(.red, for: .normal)
                conciseButton.setTitle("Not yet added", for: .normal)
            }
        }
    }

}
