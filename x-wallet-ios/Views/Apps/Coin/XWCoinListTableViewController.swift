//
//  XWCoinListTableViewController.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/27.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWCoinListTableViewController: UIBaseTableViewController {
    var lastScrollOffset: CGFloat = 0
    
    var isScrollDown: Bool = true
    
    var searchButton: UIBarButtonItem!
    
    var addMoreButton:UIButton!
    
    var holdDataModels: [CoinsModel] = [CoinsModel]()
    var issuedDataModels: [CoinsModel] = [CoinsModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UINib(nibName: "XWCoinTableViewCell", bundle: nil), forCellReuseIdentifier: "XWCoinTableViewCell")
        
        
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
        
        holdDataModels = [CoinsModel(title: "Chinese Zodiac Coins", content: "Possession：108", canTansfer: false, stared: true, newMessage: false),
                          CoinsModel(title: "Star Coin", content: "Possession：8292", canTansfer: false, stared: false, newMessage: false),
                          CoinsModel(title: "Vermicelli", content: "Possession：746", canTansfer: false, stared: false, newMessage: false)]
        
        issuedDataModels = [CoinsModel(title: "iClass Coins", content: "Transfer/Limited：2500/3000", canTansfer: true, stared: true, newMessage: false),
                            CoinsModel(title: "The Dog Coins", content: "Transfer/Limited：7668/None", canTansfer: true, stared: false, newMessage: false)]
    }
    
    @objc func search(_ : UIBarButtonItem) {
        let search: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        self.present(search.instantiateInitialViewController() as! UINavigationController, animated: true) {
            
        }
    }
    
    @objc func add(_ : UIButton) {
        self.performSegue(withIdentifier: "createCoin", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.addMoreButton.removeFromSuperview()
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        //        self.bottomBar.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 71, width: UIScreen.main.bounds.width, height: 71)
        //        self.bottomBar.bringSubview(toFront: self.addButton)
        //        self.navigationController?.view.addSubview(self.bottomBar)
        self.navigationController?.view.addSubview(self.addMoreButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return holdDataModels.count
        }else {
            return issuedDataModels.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XWCoinTableViewCell", for: indexPath) as! XWCoinTableViewCell
        if indexPath.section == 0 {
            cell.coinData = holdDataModels[indexPath.row]
        }else {
            cell.coinData = issuedDataModels[indexPath.row]
            if indexPath.row == 0 {
                cell.transferButton.addTarget(self, action: #selector(transferAction(_:)), for: .touchUpInside)
                cell.transferButton.tag = indexPath.row
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }else {
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "goToDetail", sender: nil)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isScrollDown {
            self.tableView.bringSubview(toFront: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = XWCardListHeaderView.fromNib()
        headView.clearData()
        if section==0 {
            headView.titleLabel.text = "Hold"
            headView.numberButton.isHidden = false
            headView.numberButton.setTitle(" 3", for: .normal)
        }else {
            headView.titleLabel.text = "Issued"
        }
        return headView
    }
    
    @objc func transferAction(_ button: UIButton) {
        if button.tag == 0 {
            let vc = XWWebViewController()
            vc.launchURL = kTransferCoinsURL
            vc.title = "Transfer Coins"
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
