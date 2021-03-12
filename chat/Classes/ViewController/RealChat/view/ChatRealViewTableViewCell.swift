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
    @IBOutlet weak var timeLabel : UILabel!
    @IBOutlet weak var personalImage : UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
