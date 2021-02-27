//
//  AppDelegate.swift
//  Lillo
//
//  Created by Евгений Салуев on 06.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let item1 = UITabBarItem()
        let item2 = UITabBarItem()
        let item3 = UITabBarItem()
        let item4 = UITabBarItem()
        item1.image = UIImage(named: "mainScreenIcon")
        item1.title = "Услуги"
        item2.image = UIImage(named: "favouriteScreenIcon")
        item2.title = "Избранные"
        item3.image = UIImage(named: "HistoryScreenIcon")
        item3.title = "Записи"
        item4.image = UIImage(named: "PersonIcon")
        item4.title = "Личный кабинет"
        
        let mainScreen = MainScreenViewController()
        let mainScreenNavigationController = UINavigationController(rootViewController: mainScreen)
        
        mainScreenNavigationController.navigationBar.barTintColor = .white
        mainScreenNavigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "OpenSans-SemiBold", size: 30) as Any, NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 45/255, green: 82/255, blue: 124/255, alpha: 1)]
        
        mainScreen.tabBarItem = item1
        
        let favouriteScreen = FavouriteViewController()
        favouriteScreen.tabBarItem = item2
        
        let historyScreen = HistoryViewController()
        historyScreen.tabBarItem = item3
        
        let authScreen = MainAuthFileViewController()
        let MainAuthFileViewController = UINavigationController(rootViewController: authScreen)
        
        
        MainAuthFileViewController.navigationBar.barTintColor = .white
        MainAuthFileViewController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "OpenSans-SemiBold", size: 30) as Any, NSAttributedString.Key.foregroundColor: UIColor.black]
               
        authScreen.tabBarItem = item4
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.viewControllers = [mainScreenNavigationController, favouriteScreen, historyScreen, MainAuthFileViewController]
        
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        
        return true
    }


}

