//
//  XWContactListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/14.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyUserDefaults
class XWContactListTableViewController: UIBaseViewController,UITableViewDelegate,UITableViewDataSource {
    var addButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    typealias fucBlock = (_ user :XWUser) ->()
    
    var blockproerty:fucBlock!
    
    var users: [XWUser] = [XWUser]()
    
    var isPresent: Bool?

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
        self.getUserData()
        self.tableView.index
        
        if self.isPresent! {
            let back = UIBarButtonItem(
                image: UIImage.init(named: "closeButton"),
                style: .plain,
                target: self,
                action: #selector(goBack(_:))
            )
            back.tintColor = Colors.tintColor
            self.navigationItem.leftBarButtonItem = back
        }
    }
    
    @objc func goBack(_ : UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func add(_ : UIBarButtonItem) {
        AVCaptureSessionManager.checkAuthorizationStatusForCamera(grant: {
            let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let contact = Main.instantiateViewController(withIdentifier: "XWScanViewController") as! XWScanViewController
            contact.blockproerty={ (result) in
                DispatchQueue.main.async {
                    contact.dismiss(animated: true, completion: nil)
                    let action = result.removingPercentEncoding!.getHostStringParameter()
                    if action == ScanType.infoCode.rawValue {
                        let userId = result.removingPercentEncoding!.getQueryStringParameter(param: "id")
                        if userId != nil {
                            let detail = Main.instantiateViewController(withIdentifier: "XWFriendDetailViewController") as! XWFriendDetailViewController
                            detail.userId = Int64(userId!)
                            self.navigationController?.pushViewController(detail, animated: true)
                        }
                    }
                }
            }
            let navi = UIBaseNavigationViewController(rootViewController: contact)
            self.navigationController?.present(navi, animated: true, completion: {
                
            })
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
        return 90
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XWContactTableViewCell", for: indexPath) as! XWContactTableViewCell
        let user = users[indexPath.row]
        if user.profilePic != nil {
            cell.headView.image = user.profilePic
        }else {
            if user.avatar != nil {
                cell.headView.kf.setImage(with: URL(string: user.avatar!))
            }
        }
        cell.nameLabel.text = user.name
        // Configure the cell...
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= 1{
            if let _ = blockproerty{
                let user = users[indexPath.row]
                blockproerty(user)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headView = XWContactHeadView.fromNib()
//        headView.titleLabel.text = "A"
//        return headView
//    }
    
    func getUserData() {
        FriendshipControllerAPI.myFriendsUsingGET(accountId:Int64(Defaults[.userId])) { (accounts, error) in
            self.users.removeAll()
            let my = XWUser(name: XWLocalManager.sharedInstance().localUser.loginName!, email: XWLocalManager.sharedInstance().localUser.email, id: "\(XWLocalManager.sharedInstance().localUser.id!)", profilePic:nil, avatar:XWLocalManager.sharedInstance().localUser.avatar)
            self.users.append(my)
            for ele in accounts! {
                let user = XWUser(name: ele.loginName!, email: ele.email, id: "\(ele.id!)", profilePic:nil, avatar:ele.avatar)
                self.users.append(user)
            }
            self.tableView.reloadData()
        }
    }
}
