//
//  OneChatLeftCell.swift
//  chat
//
//  Created by jian cao on 2021/4/29.
//

import UIKit

class OneChatLeftCell: UITableViewCell {
    
    @IBOutlet weak var contextLable : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refresh(context:String){
        contextLable.text = context
    }
}
