//
//  ViewController.swift
//  Chat Room
//
//  Created by Vishnu on 14/10/19.
//  Copyright © 2019 Chatroom. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var ref: DatabaseReference!
    var UserName:String?
    @IBOutlet weak var chatTable: UITableView!
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginAnony()
        ref = Database.database().reference()
        chatTable.delegate = self
        chatTable.dataSource = self
    }

    
    var listOfChatInfo = [Chat]()
    func loadChatRoom(){
        self.ref.child("chat").queryOrdered(byChild: "postData").observe( .value, with:  { ( snapshot ) in
            self.listOfChatInfo.removeAll()
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapshot {
                    if let postData = snap.value as? [String:AnyObject] {
                        let username = postData["name"] as? String
                        let text = postData["text"] as? String
                        
                        var postDate:CLong?
                        if let postdateIn = postData["postDate"] as? CLong {
                            postDate = postdateIn

                        }
                        self.listOfChatInfo.append(Chat(userName: username!, text: text!, datePost: "\(postDate)"))
                    }
                }
                self.chatTable.reloadData()
                let indexpath = IndexPath(row: self.listOfChatInfo.count-1, section: 0)
                self.chatTable.scrollToRow(at: indexpath, at: .bottom, animated: true)
            }

        })
    }
    
    
    func loginAnony(){
        Auth.auth().signInAnonymously() {         (authResult, error) in
            guard let user = authResult?.user else { return }
            let isAnonymous = user.isAnonymous
            let uid = user.uid
            self.loadChatRoom()
        }
    }

    @IBAction func clickBtn(_ sender: Any) {
        let dic = [ "text" : txtField.text, "name" : UserName!, "postData" : ServerValue.timestamp()] as [String:Any]
        self.ref.child("chat").childByAutoId().setValue(dic)
        self.txtField.text = nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfChatInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellChat:ChatCell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        cellChat.setChat(chat: listOfChatInfo[indexPath.row])
        return cellChat
    }
}

