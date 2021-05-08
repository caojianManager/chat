//
//  ChatPersonalViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/6.
//

import UIKit

class ChatPersonalViewController: UIViewController {
    
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var contentView : UIView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = UserSessionManager.getInstance.currentUser.userName
        userId.text = UserSessionManager.getInstance.currentUserID()
        navigationItem.title = "我"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configScrollView()
    }
    func configScrollView(){
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height:0)
        scrollView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func logoutButtonClick(){
        
        let chatUserDefaultUtil = ChatUserDefaultUtil()
        chatUserDefaultUtil.saveUSerDefaultObject(object: false as AnyObject, key: autoLoginKey)
        chatUserDefaultUtil.removeObjectWithKey(key: currentUser)
        let chatOldVC = ChatOldLoginViewController()
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = chatOldVC
    }
    

   

}
