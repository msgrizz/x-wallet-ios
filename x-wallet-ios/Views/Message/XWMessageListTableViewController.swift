//
//  XWMessageListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import CoreData
import SugarRecord

class XWMessageListTableViewController: UIBaseTableViewController,NSFetchedResultsControllerDelegate {
    lazy var db: CoreDataDefaultStorage = {
        let store = CoreDataStore.named(dataName)
        let bundle = Bundle(for: self.classForCoder)
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    }()
    
    var observable: RequestObservable<ConversationEntity>!
    
    func setup() {
        let request: FetchRequest<ConversationEntity> = FetchRequest<ConversationEntity>().sorted(with: "lastModifyTime", ascending: false)
        self.observable = self.db.observable(request: request)
        self.observable.observe { changes in
            switch changes {
            case .initial(let objects):
            print("\(objects.count) objects in the database")
                break
            case .update(let deletions, let insertions, let modifications):
                if insertions.count > 0 {
                    for ele in insertions {
                        self.entityArrays.insert(ele.element, at: 0)
                    }
                    self.convertData()
                }
                if modifications.count > 0 {
                    debugPrint(insertions)
                }
            print("\(deletions.count) deleted | \(insertions.count) inserted | \(modifications.count) modified")
                break
//            case .error(let error):
//            print("Something went wrong")
//                break
            default:
                print("Something went wrong")
                break
            }
        }
    }

    var addContactButton: UIBarButtonItem!
    var dataModels: [XWConversationViewModel] = [XWConversationViewModel]()
    var entityArrays: [ConversationEntity] = [ConversationEntity]()
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

        
        entityArrays = try! db.fetch(FetchRequest<ConversationEntity>().sorted(with: "lastModifyTime", ascending: false))
        self.convertData()
        self.setup()
    }
    
    func convertData() {
        dataModels.removeAll()
        for ele in entityArrays {
            var model = XWConversationViewModel()
            model.name = ele.name!
            model.content = ele.name!
            model.headURL = ele.avatar ?? ""
            model.time = ele.lastModifyTime
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
            contact.blockproerty={ (user) in
                DispatchQueue.main.async {
                    contact.dismiss(animated: true, completion: nil)
                    let dto = SConversationDTO(name: user.name, creator:Int64(Defaults[.userId]), partner:Int64(user.id))
                    SConversationControllerAPI.addUsingPOST(sConversationDTO: dto, completion: { (conversion, error) in
                        do {
                            try self.db.operation { (context, save) throws in
                                // Do your operations here
                                let entity: ConversationEntity = try context.new()
                                XWConvertManager.sharedInstance().convertConversation(conversation: conversion!, entity: entity)
                                try context.insert(entity)
                                save()
                            }
                        } catch {
                            // There was an error in the operation
                        }
                    })
                }
            }
            let navi = UIBaseNavigationViewController(rootViewController: contact)
            self.navigationController?.present(navi, animated: true, completion: {
                
            })
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
