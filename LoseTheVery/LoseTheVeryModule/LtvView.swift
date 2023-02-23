//
//  LTVView.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit
import SnapKit

class LtvView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fill()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Properties
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    lazy var pencilImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.Design.Images.pencilIcon
        
        return imageView
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "The best way to remove 'very' from your vocabulary."
        label.textColor = Constants.Design.Colors.lightGrayColor
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        
        return label
    }()
    
    lazy var veryLabel: UILabel = {
        let label = UILabel()
        label.text = "very\n\n+"
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var simpleWordTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = UIFont.boldSystemFont(ofSize: 28)
        textField.autocapitalizationType = .none
        textField.textColor = .black
        
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 28),
                          NSAttributedString.Key.foregroundColor: Constants.Design.Colors.lightGrayColor]
        textField.attributedPlaceholder = NSAttributedString(string: "loading...", attributes: attributes)
        
        return textField
    }()
    
    lazy var equalsLabel: UILabel = {
        let label = UILabel()
        label.text = "="
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var conciseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Constants.Design.Colors.lightGrayColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitle("loading...", for: .normal)
        button.titleLabel?.font = UIFont(descriptor: UIFontDescriptor
                                    .preferredFontDescriptor(withTextStyle: .body)
                                    .withDesign(.serif)!, size: 32)
        
        return button
    }()
    
    lazy var getResultButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Get/Refresh result", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    lazy var randomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Random", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    lazy var updateDatabaseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.Design.Colors.lightGrayColor
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Make suggestion", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    //MARK: Fill
    private func fill() {
        backgroundColor = .white
        
        scrollView.bounces = true
        scrollView.keyboardDismissMode = .onDrag
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }
        
        contentView.addSubview(pencilImageView)
        pencilImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        contentView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(pencilImageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(36)
        }
        
        contentView.addSubview(veryLabel)
        veryLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(simpleWordTextField)
        simpleWordTextField.snp.makeConstraints { make in
            make.top.equalTo(veryLabel.snp.bottom).offset(25)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        contentView.addSubview(equalsLabel)
        equalsLabel.snp.makeConstraints { make in
            make.top.equalTo(simpleWordTextField.snp.bottom).offset(25)
            make.centerX.equalTo(simpleWordTextField)
        }
        
        contentView.addSubview(conciseButton)
        conciseButton.snp.makeConstraints { make in
            make.top.equalTo(equalsLabel.snp.bottom).offset(25)
            make.left.right.height.equalTo(simpleWordTextField)
        }
        
        contentView.addSubview(getResultButton)
        getResultButton.snp.makeConstraints { make in
            make.top.equalTo(conciseButton.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(40)
            make.height.equalTo(45)
            make.width.equalTo(120)
        }
        
        contentView.addSubview(randomButton)
        randomButton.snp.makeConstraints { make in
            make.top.height.width.equalTo(getResultButton)
            make.right.equalToSuperview().offset(-40)
        }
        
        contentView.addSubview(updateDatabaseButton)
        updateDatabaseButton.snp.makeConstraints { make in
            make.top.equalTo(randomButton.snp.bottom).offset(30)
            make.bottom.equalToSuperview().offset(-60)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(30)
        }
    }
}
