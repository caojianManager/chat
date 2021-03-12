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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatRealViewTableViewCellIdentifier, for: indexPath) as! ChatRealViewTableViewCell
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

extension ChatRealViewController : UITableViewDelegate {
    
}
