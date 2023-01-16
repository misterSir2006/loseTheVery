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
    
    override func loadView() {
        view = vcView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.getRecords(simpleTextField: vcView.simpleWordTextField)
        AlertService.showAlert(style: .alert, title: "123", message: "456")
    }
    
    private func setupUI() {
        vcView.conciseButton.addTarget(self, action: #selector(conciseTapped(_:)), for: .touchUpInside)
        
        let hideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        vcView.addGestureRecognizer(hideKeyboardGestureRecognizer)
    }

    @objc func conciseTapped(_ sender: UIButton) {
        
        guard let url = URL(string: "https://www.dictionary.com/browse/\(sender.titleLabel?.text ?? " ")") else { return }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

}

