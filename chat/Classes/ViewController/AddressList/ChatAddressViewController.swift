//
//  ChatAddressViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/6.
//

import UIKit

class ChatAddressViewController: UIViewController {
    
    private let chatAddressTableViewICelldentifier : String = "ChatAddressTableViewCell"
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatAddressTableViewICelldentifier, for: indexPath)
        return cell
    }
       

}

extension ChatAddressViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


