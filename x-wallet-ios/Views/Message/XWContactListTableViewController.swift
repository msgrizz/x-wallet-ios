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

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            return 20
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWMyContactTableViewCell", for: indexPath)

            // Configure the cell...

            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContactTableViewCell", for: indexPath)

            // Configure the cell...

            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "A"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 24
        }
    }
}
