//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVC = SearchModuleBuilder.build()
        rootVC.tabBarItem.title = "Search via iTunes"
        
        let rootVSC = SearchSongsModuleBuilder.build()
        rootVSC.tabBarItem.title = "Search songs"
        
        let navVC = self.configuredNavigationController
        navVC.viewControllers = [rootVC]
        navVC.viewControllers?.append(rootVSC)
       
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredNavigationController: UITabBarController = {
        let navVC = UITabBarController()
        navVC.tabBar.barStyle = .black
        navVC.tabBar.barTintColor = UIColor.varna
        navVC.tabBar.isTranslucent = false
        
        return navVC
    }()
}
