//
//  ChatAddressViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/6.
//

import UIKit
import SwiftyZeroMQ

class ChatAddressViewController: UIViewController {
    
    private let chatAddressTableViewICelldentifier : String = "ChatAddressTableViewCell"
    
    @IBOutlet weak var tableView : UITableView!
    
    //用于存放所有联系用户
    var userRecordArray :[ChatDBUserRecord]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dictionary: [String:Int] = ["isRealChat":0]
        let predicate = ChatDBPredicate(dictionary: dictionary)
        userRecordArray = ChatDataBase.getInstance().userTable.record(with: predicate)
        navigationItem.title = "联系人"
        configTableView()
    }
    
 
    
    
    func configTableView(){
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(UINib(nibName: "ChatAddressTableViewCell", bundle: nil), forCellReuseIdentifier: chatAddressTableViewICelldentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}


extension ChatAddressViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userRecordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatAddressTableViewICelldentifier, for: indexPath) as! ChatAddressTableViewCell
        cell.refreshCell(user: userRecordArray[indexPath.row])
        return cell
    }
       

}

extension ChatAddressViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatPersonalDetailsVC = ChatPersonalDetailsViewController()
        chatPersonalDetailsVC.userInfo = userRecordArray[indexPath.row]
        navigationController?.pushViewController(chatPersonalDetailsVC, animated: true)
    }
}


