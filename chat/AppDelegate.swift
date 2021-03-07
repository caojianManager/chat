//
//  AppDelegate.swift
//  chat
//
//  Created by jian cao on 2021/3/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let chatHomeVC = ChatHomeViewController()
        window?.rootViewController = chatHomeVC
        window?.makeKeyAndVisible()
        return true
    }

}

