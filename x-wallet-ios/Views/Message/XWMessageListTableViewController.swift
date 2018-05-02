//
//  XWMessageListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class XWMessageListTableViewController: UIBaseTableViewController{
    var addContactButton: UIBarButtonItem!
    var dataModels: [XWConversationViewModel] = [XWConversationViewModel]()
    
    var conversationArray: [RCConversation] = [RCConversation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Message", comment: "")
        
        addContactButton = UIBarButtonItem(
            image: UIImage(named: "addContact"), style: .plain, target: self, action: #selector(addAction(_ :))
        )
        addContactButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = addContactButton
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(UINib(nibName: "XWConversationTableViewCell", bundle: nil), forCellReuseIdentifier: "XWConversationTableViewCell")
        self.tableView.register(UINib(nibName: "XWNewConversationTableViewCell", bundle: nil), forCellReuseIdentifier: "XWNewConversationTableViewCell")
        
        conversationArray = RCIMClient.shared().getConversationList([(RCConversationType.ConversationType_PRIVATE).rawValue]) as! [RCConversation]
        self.convertData()
    }
    
    func convertData() {
        dataModels.removeAll()
        for ele in conversationArray {
            var model = XWConversationViewModel()
            model.name = ele.conversationTitle!
            
            if ele.lastestMessage.isKind(of: RCImageMessage.classForCoder()) {
                model.content = "[Image]"
            }else if ele.lastestMessage.isKind(of: RCVoiceMessage.classForCoder()) {
                model.content = "[Voice]"
            }else if ele.lastestMessage.isKind(of: RCTextMessage.classForCoder()) {
                let mes = ele.lastestMessage as! RCTextMessage
                model.content = mes.content
                debugPrint(mes.extra)
            }
            model.content = ele.conversationTitle!
//            model.headURL = ele.avatar ?? ""
            model.time = ele.receivedTime
            model.id = ele.targetId
            dataModels.append(model)
        }
        self.tableView.reloadData()
    }
    
    @objc func addAction(_ : UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToMyList", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataModels.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWNewConversationTableViewCell", for: indexPath) as! XWNewConversationTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWConversationTableViewCell", for: indexPath) as! XWConversationTableViewCell
            let data = dataModels[indexPath.row - 1]
            cell.dataModel = data
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0{
            self.performSegue(withIdentifier: "goToMessageView", sender: nil)
        }else {
            let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let contact = Main.instantiateViewController(withIdentifier: "XWContactListTableViewController") as! XWContactListTableViewController
            contact.isPresent = true
            contact.blockproerty={ (user) in
                DispatchQueue.main.async {
                    contact.dismiss(animated: true, completion: nil)
                    let dto = SConversation2DTO(creator:Int64(Defaults[.userId]), partner:Int64(user.id))
                    SConversation2ControllerAPI.addSConversation2UsingPOST(sConversation2DTO: dto, completion: { (con, error) in
                        
                    })
                }
            }
            let navi = UIBaseNavigationViewController(rootViewController: contact)
            self.navigationController?.present(navi, animated: true, completion: {
                
            })
        }
    }
    
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row > 0{
//            return true
//        }else {
//            return false
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            print("Deleted")
//            let data = dataModels[indexPath.row - 1]
//            do {
//                try self.db.operation { (context, save) throws in
//                    let predicate: NSPredicate = NSPredicate(format: "id == %@", String(data.id!))
//                    let me: ConversationEntity? = try! context.request(ConversationEntity.self).filtered(with: predicate).fetch().first
//                    if let me = me {
//                        try context.remove([me])
//                        save()
//                    }
//                }
//            } catch {
//                // There was an error in the operation
//            }
//            dataModels.remove(at: indexPath.row - 1)
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }

}
