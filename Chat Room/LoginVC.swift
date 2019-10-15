//
//  LoginVC.swift
//  Chat Room
//
//  Created by Vishnu on 15/10/19.
//  Copyright © 2019 Chatroom. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var nameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 20
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        performSegue(withIdentifier: "chatRoom", sender: nil)
    }
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chatRoom" {
            
            if let dis = segue.destination as? ViewController {
                dis.UserName = nameTxt.text
            }
        }
    }
}
