//
//  SceneDelegate.swift
//  AppStore
//
//  Created by jayden on 2023/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = tapBarController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
    }

}

