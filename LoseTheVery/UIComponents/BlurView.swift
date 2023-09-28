//
//  BlurView.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 28.09.2023.
//

import UIKit

final class BlurView: UIView {
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        fill()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    lazy var blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
    
    lazy var veryLabel: UILabel = {
        let label = UILabel()
        label.text = "very\n\n+"
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var simpleWordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var equalsLabel: UILabel = {
        let label = UILabel()
        label.text = "="
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var conciseLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Design.Colors.greenColor
        label.textAlignment = .center
        label.font = UIFont(descriptor: UIFontDescriptor
                                    .preferredFontDescriptor(withTextStyle: .body)
                                    .withDesign(.serif)!, size: 32)
        
        return label
    }()
    
    // MARK: - Fill
    private func fill() {
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        addSubview(blurEffectView)
        blurEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(simpleWordLabel)
        simpleWordLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(veryLabel)
        veryLabel.snp.makeConstraints { make in
            make.bottom.equalTo(simpleWordLabel.snp.top).offset(-25)
            make.centerX.equalToSuperview()
        }
        
        addSubview(equalsLabel)
        equalsLabel.snp.makeConstraints { make in
            make.top.equalTo(simpleWordLabel.snp.bottom).offset(25)
            make.centerX.equalTo(simpleWordLabel)
        }
        
        addSubview(conciseLabel)
        conciseLabel.snp.makeConstraints { make in
            make.top.equalTo(equalsLabel.snp.bottom).offset(25)
            make.left.right.height.equalTo(simpleWordLabel)
        }
        
        sendSubviewToBack(blurEffectView)
    }
    
}

