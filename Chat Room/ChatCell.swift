//
//  ChatCellTableViewCell.swift
//  Chat Room
//
//  Created by Vishnu on 15/10/19.
//  Copyright © 2019 Chatroom. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var msgText: UITextView!
    @IBOutlet weak var msgVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       msgVw.layer.cornerRadius = 20
    }
    
    func setChat(chat:Chat){
        nameLbl.text = chat.userName
        msgText.text = chat.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
