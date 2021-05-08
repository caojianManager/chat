//
//  ChatRealViewTableViewCell.swift
//  chat
//
//  Created by jian cao on 2021/3/7.
//

import UIKit



class ChatRealViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var userNum : UILabel!
    @IBOutlet weak var personalImage : UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
     
        // Initialization code
    }


    
    func refreshCell(user:ChatDBUserRecord){
        nameLabel.text = user.userName
        userNum.text = String(describing: user.userId)
    }
}
