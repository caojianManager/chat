//
//  ChatRealViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/6.
//

import UIKit

class ChatRealViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    private let chatRealViewTableViewCellIdentifier : String = "ChatRealViewTableViewCell"
    //存放用户信息
    var userRecordArray :[ChatDBUserRecord]!

    override func viewDidLoad() {
        super.viewDidLoad()

        let dictionary: [String:Int] = ["isRealChat":1]
        let predicate = ChatDBPredicate(dictionary: dictionary)
        userRecordArray = ChatDataBase.getInstance().userTable.record(with: predicate)
      
        navigationItem.title = "聊天"
        configTableView()
  
    }
    
    func configTableView(){
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(UINib(nibName: "ChatRealViewTableViewCell", bundle: nil), forCellReuseIdentifier: chatRealViewTableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
 

}

extension ChatRealViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userRecordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatRealViewTableViewCellIdentifier, for: indexPath) as! ChatRealViewTableViewCell
        cell.refreshCell(user: userRecordArray[indexPath.row])
        return cell
        
    }
    
}

extension ChatRealViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
