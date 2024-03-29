//
//  tapBarController.swift
//  AppStore
//
//  Created by jayden on 2023/03/21.
//

import UIKit

class tapBarController: UITabBarController {
    
    
    // TapBarController 생성
    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "mail"), tag: 0)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 1)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [todayViewController, appViewController]
    }


}

