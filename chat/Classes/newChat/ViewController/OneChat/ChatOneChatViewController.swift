//
//  ChatOneChatViewController.swift
//  chat
//
//  Created by jian cao on 2021/4/3.
//

import UIKit

//一个委托
protocol ChatKeyboardDelegate {
    

}

class ChatOneChatViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var bottomConstraint:NSLayoutConstraint!
    @IBOutlet weak var topConstrint : NSLayoutConstraint!
    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var sendButton : UIButton!
    @IBOutlet weak var userName :UILabel!
    
    var toUser: ChatDBUserRecord!
    private let cellOne :String = "OneChatLeftCell"
    
    var oneChatMessage:[ChatDBOneChatRecord]!
    private var bottomSafeAreaHeight: CGFloat {
        UIScreen.main.bounds.height >= 812 ? 34 : 0
    }
    private var topSafeAreaHeight: CGFloat {
        UIScreen.main.bounds.height >= 812 ? 34 : 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        bottomConstraint.constant = bottomSafeAreaHeight
        topConstrint.constant = topSafeAreaHeight
        textView.layer.cornerRadius = textView.bounds.height / 2
        sendButton.layer.cornerRadius = sendButton.bounds.height / 2
        userName.text = toUser.userName
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "OneChatLeftCell", bundle: nil), forCellReuseIdentifier: cellOne)
        let dictPredicate:[String:String] = ["userid":String(format: "%@", arguments: [toUser.userId])]
        
        let chatDBPredicate = ChatDBPredicate(dictionary: dictPredicate,orderColumn: "lastid",isOrderByDesc: true, limitCount: 100)
        
    
        oneChatMessage = ChatDataBase.getInstance().oneChatTable.record(with: chatDBPredicate)
        print(oneChatMessage)
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    

    @IBAction func sendMessageButton(){
        guard let data = textView.text else {
            return
        }
        let bool = ChatProcessorManager.getInstance.oneChatOneMessageProcessor.sendMessageWithData(data: data, targetId:  String(format: "%@", arguments: [toUser.userId]))
        if bool == false{
            let dictPredicate:[String:String] = ["userid":String(format: "%@", arguments: [toUser.userId])]
            
            let chatDBPredicate = ChatDBPredicate(dictionary: dictPredicate,orderColumn: "lastid",isOrderByDesc: true, limitCount: 100)
            
        
            oneChatMessage = ChatDataBase.getInstance().oneChatTable.record(with: chatDBPredicate)
            tableView.reloadData()
            print(oneChatMessage)
        }
    }
    
    @IBAction func closeButton(){
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension ChatOneChatViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oneChatMessage.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellOne, for: indexPath) as! OneChatLeftCell
        cell.refresh(context: oneChatMessage[indexPath.row].data)
        return cell
    }


}

extension ChatOneChatViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
