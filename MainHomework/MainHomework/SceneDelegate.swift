//
//  SceneDelegate.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 11.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let applicationScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: applicationScene)
        let mainController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainController)
        navigationController.navigationBar.backgroundColor = .clear
        self.window?.backgroundColor = .white
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

