//
//  XWContactListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/14.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWContactListTableViewController: UIBaseViewController,UITableViewDelegate,UITableViewDataSource {
    var addButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    typealias fucBlock = (_ name :String) ->()
    
    var blockproerty:fucBlock!
    
    var userData: XWDemoData!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fakeData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        searchBar.backgroundColor=UIColor.clear
        searchBar.placeholder = NSLocalizedString("Search", comment: "")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }else {
            return 44
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }else {
            return userData.users.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWMyContactTableViewCell", for: indexPath) as! XWMyContactTableViewCell
            cell.headView.image = userData.myself.profilePic
            cell.nameLabel.text = userData.myself.name
            cell.numberLabel.text = "My Number:"+userData.myself.id
            // Configure the cell...

            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContactTableViewCell", for: indexPath) as! XWContactTableViewCell
            let user = userData.users[indexPath.row]
            cell.headView.image = user.profilePic
            cell.nameLabel.text = user.name
            // Configure the cell...
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if let _ = blockproerty{
                let user = userData.users[indexPath.row]
                blockproerty(user.name)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 28
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = XWContactHeadView.fromNib()
        headView.titleLabel.text = "A"
        return headView
    }
    
    func fakeData() {
        userData = XWDemoData()
        userData.myself = XWUser.init(name: "Jane Smith", email: "test@gmail.com", id: "887gcfw23444wq2803", profilePic: UIImage(named: "head1")!)
        userData.users = [XWUser.init(name: "Bill Anderson", email: "test@gmail.com", id: "887gcfw23444wq1561", profilePic: UIImage(named: "head2")!),
                          XWUser.init(name: "Pauline Banister", email: "test@gmail.com", id: "887gcfw23444wq1522", profilePic: UIImage(named: "head3")!),
                          XWUser.init(name: "Michael Barlow", email: "test@gmail.com", id: "887gcfw23444wq1211", profilePic: UIImage(named: "head4")!)]
    }
    
    func getUserData() {
        
    }
}
