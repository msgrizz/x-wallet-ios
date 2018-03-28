//
//  XWImportantContractTableViewController.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/27.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWImportantContractTableViewController: UIBaseTableViewController,UIActionSheetDelegate {

    var lastScrollOffset: CGFloat = 0
    
    var isScrollDown: Bool = true
    
    var searchButton: UIBarButtonItem!
    
    var addMoreButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UINib(nibName: "XWContractDemoTableViewCell", bundle: nil), forCellReuseIdentifier: "XWContractDemoTableViewCell")
        
        
        //        self.tableView.contentInset.bottom = self.bottomBar.frame.size.height
        //        self.tableView.scrollIndicatorInsets.bottom = self.bottomBar.frame.size.height
        
        searchButton = UIBarButtonItem(
            image: UIImage.init(named: "searchButton"),
            style: .plain,
            target: self,
            action: #selector(search(_:))
        )
        searchButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = searchButton
        
        addMoreButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.width - 70, y: UIScreen.main.bounds.height - 100, width: 39, height: 39))
        addMoreButton.setImage(UIImage(named: "bottomAdd"), for: .normal)
        addMoreButton.addTarget(self, action: #selector(add(_:)), for: UIControlEvents.touchUpInside)
    }
    
    @objc func search(_ : UIBarButtonItem) {
        let search: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        self.present(search.instantiateInitialViewController() as! UINavigationController, animated: true) {
            
        }
    }
    
    @objc func add(_ : UIButton) {
        let alertSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle:nil , otherButtonTitles:"Currency","Receipt", "Promise","Lou")
        alertSheet.show(in: self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractDemoTableViewCell", for: indexPath) as! XWContractDemoTableViewCell
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.backImageView.image = UIImage(named: "card1")
            }else if indexPath.row == 1{
                cell.backImageView.image = UIImage(named: "card3")
            }else{
                cell.backImageView.image = UIImage(named: "card6")
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = XWWebViewController()
        
        if indexPath.row == 0 {
            vc.launchURL = kMiniContractURL
            vc.title = "Currency"
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            vc.launchURL = kReceiptURL
            vc.title = "Receipt"
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            vc.launchURL = kLouURL
            vc.title = "Lou"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isScrollDown {
            self.tableView.bringSubview(toFront: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = XWImportantHeadView.fromNib()
        return headView
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.tableView {
            let y = scrollView.contentOffset.y
            if (y > self.lastScrollOffset) {
                isScrollDown = true
            } else {
                isScrollDown = false
            }
            self.lastScrollOffset = y;
        }
    }
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        let vc = XWWebViewController()
        if buttonIndex == 1{
            vc.launchURL = kCreateContractURL
            vc.title = "Create Currency"
            self.navigationController?.pushViewController(vc, animated: true)
        }else if buttonIndex == 2{
            vc.launchURL = kCreatReceiptURL
            vc.title = "Create Receipt"
            self.navigationController?.pushViewController(vc, animated: true)
        }else if buttonIndex == 3{
            vc.launchURL = kCreatePromiseURL
            vc.title = "Create Promise"
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if buttonIndex == 4{
            vc.launchURL = kCreateLouURL
            vc.title = "Create Lou"
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if buttonIndex == 5{
            
            
        }
        else {
        }
        
    }

}
