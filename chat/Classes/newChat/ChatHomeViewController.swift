//
//  ChatHomeViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/6.
//

import UIKit

class ChatHomeViewController: UITabBarController {
    
    
    
    private var navigationController0 : UINavigationController!
    private var navigationController1 : UINavigationController!
    private var navigationController2 : UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let realChatVC = ChatRealViewController()
        navigationController0 = UINavigationController(rootViewController: realChatVC)
        navigationController0.tabBarItem.title = "聊天"
        navigationController0.tabBarItem.image = UIImage(named: "realChat-a")
        
        let addressListVC = ChatAddressViewController()
        navigationController1 = UINavigationController(rootViewController: addressListVC)
        navigationController1.tabBarItem.title = "联系人"
        navigationController1.tabBarItem.image = UIImage(named: "addressList-a")
        
        let personalVC = ChatPersonalViewController()
        navigationController2 = UINavigationController(rootViewController: personalVC)
        navigationController2.tabBarItem.title = "我"
        navigationController2.tabBarItem.image = UIImage(named: "person-a")
        
    
        viewControllers = [navigationController0,navigationController1,navigationController2]
        
    }



}
