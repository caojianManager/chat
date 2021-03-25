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
        let chatOldLoginVC = ChatOldLoginViewController()
        let chatHomeVC = ChatHomeViewController()
  
        let test = ChatUserDefaultUtil()
        test.saveUSerDefaultObject(object: false as AnyObject, key: autoLoginKey)
        let isAutoLogin : Bool = ChatUserDefaultUtil.getUserDefaultObject(key: autoLoginKey).boolValue
        if(isAutoLogin){
            window?.rootViewController = chatHomeVC
        }else{
            window?.rootViewController = chatOldLoginVC
        }

        window?.makeKeyAndVisible()
        return true
    }

}

