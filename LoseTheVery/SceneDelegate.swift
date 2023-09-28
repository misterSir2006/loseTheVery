//
//  SceneDelegate.swift
//  LoseTheVery
//
//  Created by Илья Шахназаров on 15.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = LtvViewController()
        
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
    
// MARK: - Scene Lifecycle with Blur
    let blur = BlurView()
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        self.blur.removeFromSuperview()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        self.blur.removeFromSuperview()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        if !self.blur.isDescendant(of: self.window!) {

            guard let field = LtvPresenter.recordsArray.randomElement(),
                  let simpleWord = field.fields["Simple"],
                  let conciseWord = field.fields.filter({
                      $0.key != "Simple" && $0.key != "id"
                  }).randomElement()?.value else { return }
            
            blur.conciseLabel.text = conciseWord
            blur.simpleWordLabel.text = simpleWord
            
            self.window?.addSubview(self.blur)
            blur.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}

