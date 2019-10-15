//
//  Chat.swift
//  Chat Room
//
//  Created by Vishnu on 15/10/19.
//  Copyright © 2019 Chatroom. All rights reserved.
//

import UIKit

class Chat: NSObject {
    var userName:String?
    var text:String?
    var datePost:String?
        init(userName:String,text:String,datePost:String){
            self.userName = userName
            self.text = text
            self.datePost = datePost
    }
}
