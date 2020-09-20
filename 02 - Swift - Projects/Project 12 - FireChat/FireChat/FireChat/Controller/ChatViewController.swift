//
//  ChatViewController.swift
//  FireChat
//
//  Created by Kyle L. on 7/1/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    
    let df = Firestore.firestore()
    var messages: [Message] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        loadMessages()
    }
    }

//MARK: - UITableView Data Source
extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email{
            cell.youLabel.isHidden = true
            cell.meLabel.isHidden = false
            cell.messageBubble.backgroundColor = .purple
            cell.label.textColor = .white
        }else{
            cell.youLabel.isHidden = false
            cell.meLabel.isHidden = true
            cell.messageBubble.backgroundColor = .systemTeal
            cell.label.textColor = .white
        }
        return cell}}

//MARK: - Log Out Pressed
extension ChatViewController{
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signoutError as NSError {
            print(signoutError)
        }}}

//MARK: - Send Pressed
extension ChatViewController{
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email{
            df.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.bodyField: messageBody,
                Constants.FStore.senderField: messageSender,
                Constants.FStore.dateField: Date().timeIntervalSince1970
            ])
            { error in
                if let e = error{
                    print(e)
                }else {
                    print("data saved")
                    DispatchQueue.main.async {
                        self.messageTextField.text = ""
                    }}}}}}

//MARK: - Load Messages Function
extension ChatViewController{
    func loadMessages(){
        df.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).addSnapshotListener{
            query, error in
            self.messages = []
            if let e = error{
                print(e)
            }else{
                if let snapshotDocuments = query?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        if let messageSender = data[Constants.FStore.senderField] as? String, let messageBody = data[Constants.FStore.bodyField] as? String{
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                   self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }}}}}}}

