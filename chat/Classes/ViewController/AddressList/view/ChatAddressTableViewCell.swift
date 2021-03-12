//
//  ChatAddressTableViewCell.swift
//  chat
//
//  Created by jian cao on 2021/3/12.
//

import UIKit

class ChatAddressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var avatarImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
