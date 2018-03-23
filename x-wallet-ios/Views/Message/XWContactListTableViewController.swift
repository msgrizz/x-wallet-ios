//
//  XWContactListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/14.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWContactListTableViewController: UITableViewController {
    var addButton: UIBarButtonItem!
    var json = NSArray()
    var arr_name = NSArray()
    var arrIndexSection : NSArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.searchBarStyle = UISearchBarStyle.minimal
        self.navigationItem.searchController = search
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Contact List"
        addButton = UIBarButtonItem(
            image: UIImage.init(named: "newMessage"),
            style: .plain,
            target: self,
            action: #selector(add(_:))
        )
        addButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = addButton
        
//        let path = Bundle.main.path(forResource: "countries", ofType: "json")
//        let data = try! Data(contentsOf:URL(fileURLWithPath: path!))
//        print(String(data: data, encoding: String.Encoding.utf8) as String!)
//        json = (try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSArray
//        arr_name = json.value(forKey: "name") as! NSArray;
//        self.tableView.reloadData()
    }
    
    @objc func add(_ : UIBarButtonItem) {
        AVCaptureSessionManager.checkAuthorizationStatusForCamera(grant: {
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "XWScanViewController")
            self.navigationController?.pushViewController(controller, animated: true)
        }){
            let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (action) in
                let url = URL(string: UIApplicationOpenSettingsURLString)
                UIApplication.shared.open(url!, options: [String: Any](), completionHandler: nil)
            })
            let con = UIAlertController(title: "权限未开启", message: "您未开启相机权限，点击确定跳转至系统设置开启", preferredStyle: UIAlertControllerStyle.alert)
            con.addAction(action)
            self.present(con, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 80
//        }else {
//            return 44
//        }
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        if section == 0 {
//            return 1
//        }else {
//            return 30
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "XWMyContactTableViewCell", for: indexPath)
//
//            // Configure the cell...
//
//            return cell
//        }
//        else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContactTableViewCell", for: indexPath)
//
//            // Configure the cell...
//
//            return cell
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "A"
//    }
//
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
//
//        return 26
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 26
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.arrIndexSection as? [String] //Side Section title
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int
    {
        return index
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrIndexSection.object(at: section) as? String
    }
    
    
    // number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let predicate = NSPredicate(format: "SELF beginswith[c] %@", arrIndexSection.object(at: section) as! CVarArg)
        let arrContacts = (arr_name as NSArray).filtered(using: predicate)
        return arrContacts.count;
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XWContactTableViewCell", for: indexPath)
        let predicate = NSPredicate(format: "SELF beginswith[c] %@", arrIndexSection.object(at: indexPath.section) as! CVarArg)
        let arrContacts = (arr_name as NSArray).filtered(using: predicate) as NSArray
        cell.textLabel?.text = arrContacts.object(at: indexPath.row) as? String
        return cell
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
