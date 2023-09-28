//
//  ViewController.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit
import SafariServices

class LtvViewController: UIViewController {
    
    private let vcView = LtvView()
    private let presenter = LtvPresenter()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func loadView() {
        view = vcView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        presenter.getVideos(offset: nil) { [self] in
            presenter.setRandomElement(data: LtvPresenter.recordsArray,
                                       simpleTextField: vcView.simpleWordTextField,
                                       conciseButton: vcView.conciseButton,
                                       state: .firstSetup)
        }
        
        vcView.simpleWordTextField.delegate = self
        
        vcView.conciseButton.addTarget(self, action: #selector(linkButtonTapped(_:)), for: .touchUpInside)
        vcView.updateDatabaseButton.addTarget(self, action: #selector(linkButtonTapped(_:)), for: .touchUpInside)
        vcView.randomButton.addTarget(self, action: #selector(randomTapped), for: .touchUpInside)
        vcView.getResultButton.addTarget(self, action: #selector(getResultTapped), for: .touchUpInside)
        
        let hideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        vcView.addGestureRecognizer(hideKeyboardGestureRecognizer)
    }
    
    // MARK: Objc funcs
    @objc func linkButtonTapped(_ sender: UIButton) {
        var string: String = ""
        
        if sender == vcView.conciseButton {
            string = UrlBuilder.buildDictionaryUrl(word: sender.titleLabel?.text)
        } else if sender == vcView.updateDatabaseButton {
            string = UrlBuilder.buildSuggestionUrl()
        }
        
        guard let url = URL(string: string) else { return }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
    
    @objc func randomTapped() {
        presenter.setRandomElement(data: LtvPresenter.recordsArray,
                                   simpleTextField: vcView.simpleWordTextField,
                                   conciseButton: vcView.conciseButton,
                                   state: .buttonClick)
        
        vcView.conciseButton.setTitleColor(Constants.Design.Colors.greenColor, for: .normal)
    }
    
    @objc func getResultTapped() {
        presenter.searchForWord(data: LtvPresenter.recordsArray,
                                simpleTextField: vcView.simpleWordTextField,
                                conciseButton: vcView.conciseButton)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

extension LtvViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        presenter.searchForWord(data: LtvPresenter.recordsArray,
                                simpleTextField: vcView.simpleWordTextField,
                                conciseButton: vcView.conciseButton)
        
        textField.resignFirstResponder()
        return true
    }
}
