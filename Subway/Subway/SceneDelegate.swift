//
//  SceneDelegate.swift
//  Subway
//
//  Created by jayden on 2023/04/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = UINavigationController(rootViewController: StationSearchViewController())
        window?.backgroundColor = .systemBackground
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

