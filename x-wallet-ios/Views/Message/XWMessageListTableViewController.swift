//
//  XWMessageListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWMessageListTableViewController: UIBaseTableViewController {
    
    var addContactButton: UIBarButtonItem!
    var dataModels: [XWConversationViewModel] = [XWConversationViewModel]()
    
    
    
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

        dataModels = fakeData()
    }
    
    @objc func addAction(_ : UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToMyList", sender: nil)
    }
    
    func fakeData() -> [XWConversationViewModel] {
        return [XWConversationViewModel(),XWConversationViewModel(),XWConversationViewModel()]
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
        self.performSegue(withIdentifier: "goToMessageView", sender: nil)
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
