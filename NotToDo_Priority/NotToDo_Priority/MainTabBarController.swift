//
//  MainTabBarController.swift
//  NotToDo_Priority
//
//  Created by jayden on 2023/04/10.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: PriorityViewController())
        let vc2 = UINavigationController(rootViewController: PriorityViewController())
        let vc3 = UINavigationController(rootViewController: BreathingViewController())
        
        vc1.title = "Priority"
        vc2.title = "NotToDo"
        vc3.title = "Imagine"
        
        vc1.tabBarItem.image = UIImage(systemName: "pencil.line")
        vc2.tabBarItem.image = UIImage(systemName: "nosign")
        vc3.tabBarItem.image = UIImage(systemName: "brain")
        
        tabBar.tintColor = .secondaryLabel
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        
    }
}
