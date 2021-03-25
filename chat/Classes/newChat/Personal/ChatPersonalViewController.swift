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
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let chatOldVC = ChatOldLoginViewController()
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = chatOldVC
    }
    

   

}
