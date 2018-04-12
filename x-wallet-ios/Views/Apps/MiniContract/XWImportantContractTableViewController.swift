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
        let vc = XWWebViewController()
        vc.isCreate = true
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cuAction = UIAlertAction(title: "Currency", style: .default, handler: {action in
            vc.launchURL = kCreateContractURL
            vc.title = "Create Currency"
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let reAction = UIAlertAction(title: "Receipt", style: .default, handler: {action in
            vc.launchURL = kCreatReceiptURL
            vc.title = "Create Receipt"
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let prAction = UIAlertAction(title: "Promise", style: .default, handler: {action in
            vc.launchURL = kCreatePromiseURL
            vc.title = "Create Promise"
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let iouAction = UIAlertAction(title: "I.O.U", style: .default, handler: {action in
            vc.launchURL = kCreateIOUURL
            vc.title = NSLocalizedString("Create I.O.U",comment: "")
            self.navigationController?.pushViewController(vc, animated: true)
        })
        alert.addAction(cancelAction)
        alert.addAction(cuAction)
        alert.addAction(reAction)
        alert.addAction(prAction)
        alert.addAction(iouAction)
        self.present(alert, animated: true, completion: nil)
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
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Main.instantiateViewController(withIdentifier: "XWMessageViewController") as! XWMessageViewController
        if indexPath.row == 0 {
            let data = XWContract.init(title: "Currency", type: .Currency, content: "Currency")
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let data = XWContract.init(title: "Receipt", type: .Receipt, content: "Receipt")
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            let data = XWContract.init(title: "I.O.U", type: .IOU, content: "I.O.U")
            vc.contractModel = data
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
}
