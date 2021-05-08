//
//  ChatPersonalDetailsViewController.swift
//  chat
//
//  Created by jian cao on 2021/4/27.
//

import UIKit

class ChatPersonalDetailsViewController: UIViewController {
    
    @IBOutlet weak var userName : UILabel!
    @IBOutlet weak var className : UILabel!
    @IBOutlet weak var userNum : UILabel!
    @IBOutlet weak var collegeName : UILabel!
    
    var userInfo : ChatDBUserRecord!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isHidden = true
        userName.text = userInfo.userName
      
        className.text = String(format: "班级:%@", arguments: [userInfo.ownClass])
        userNum.text = String(format: "学号:%@", arguments: [userInfo.userId])
        collegeName.text = String(format: "学院:%@", arguments: [userInfo.college])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func sendButton(){
        let chatOneChatVC = ChatOneChatViewController()
        chatOneChatVC.toUser = userInfo
        navigationController?.pushViewController(chatOneChatVC, animated: true)
    }
  



}
