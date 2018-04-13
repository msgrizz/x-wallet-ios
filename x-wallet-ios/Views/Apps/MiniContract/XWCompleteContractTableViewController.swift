//
//  XWCompleteContractTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWCompleteContractTableViewController: UIBaseTableViewController,UIActionSheetDelegate {

    var lastScrollOffset: CGFloat = 0
    
    var isScrollDown: Bool = true
    
    var searchButton: UIBarButtonItem!
    
    var addMoreButton:UIButton!
    
    var completeArray:  [XWContract] = [XWContract]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UINib(nibName: "XWIOUTableViewCell", bundle: nil), forCellReuseIdentifier: "XWIOUTableViewCell")
        self.tableView.register(UINib(nibName: "XWContractTableViewCell", bundle: nil), forCellReuseIdentifier: "XWContractTableViewCell")
        self.tableView.register(UINib(nibName: "XWReceiptTableViewCell", bundle: nil), forCellReuseIdentifier: "XWReceiptTableViewCell")
        self.tableView.register(UINib(nibName: "XWPromiseTableViewCell", bundle: nil), forCellReuseIdentifier: "XWPromiseTableViewCell")
        
        
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
        
//        addMoreButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.width - 70, y: UIScreen.main.bounds.height - 100, width: 39, height: 39))
//        addMoreButton.setImage(UIImage(named: "bottomAdd"), for: .normal)
//        addMoreButton.addTarget(self, action: #selector(add(_:)), for: UIControlEvents.touchUpInside)
    }
    
    @objc func search(_ : UIBarButtonItem) {
        let search: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        self.present(search.instantiateInitialViewController() as! UINavigationController, animated: true) {
            
        }
    }
    
//    @objc func add(_ : UIButton) {
//        let alertSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle:nil , otherButtonTitles:"Currency","Receipt", "Promise","Lou")
//        alertSheet.show(in: self.view)
//    }
    
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
        return self.completeArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.completeArray[indexPath.row]
        switch data.type {
        case .Currency:
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractTableViewCell", for: indexPath) as! XWContractTableViewCell
            cell.titleLabel.text = data.title
            
            let partAttribute = [NSAttributedStringKey.foregroundColor: UIColor(hex: "8a8a8f")]
            let nameAttribute = [NSAttributedStringKey.foregroundColor: UIColor(hex: "000000")]

            let partA = NSMutableAttributedString(string: "PartA:", attributes: partAttribute)
            partA.append(NSAttributedString(string: data.partAName!, attributes: nameAttribute))
            
            let partB = NSMutableAttributedString(string: "PartB:", attributes: partAttribute)
            partB.append(NSAttributedString(string: data.partBName!, attributes: nameAttribute))
            
            cell.partALabel.attributedText = partA
            cell.partBLabel.attributedText = partB
            cell.tagButton.isHidden = !data.isImportant
            return cell
        case .Receipt:
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWReceiptTableViewCell", for: indexPath) as! XWReceiptTableViewCell
            cell.timeLabel.text = data.content
            cell.titleLabel.text = data.title
            return cell
        case .Promise:
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWPromiseTableViewCell", for: indexPath) as! XWPromiseTableViewCell
            cell.detailLabel.text = data.title
            cell.partAName.text = data.partAName
            cell.partBName.text = data.partBName
            cell.partAHead.kf.setImage(with: URL(string: data.partAHead!), for: UIControlState.normal)
            cell.partBHead.kf.setImage(with: URL(string: data.partBHead!), for: UIControlState.normal)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWIOUTableViewCell", for: indexPath) as! XWIOUTableViewCell
            let iou = self.completeArray[indexPath.row]
            cell.timeLabel.text = iou.content
            cell.titleLabel.text = iou.title
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Main.instantiateViewController(withIdentifier: "XWMessageViewController") as! XWMessageViewController
        let data = self.completeArray[indexPath.row]
        vc.contractModel = data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isScrollDown {
            self.tableView.bringSubview(toFront: cell)
        }
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headView = XWImportantHeadView.fromNib()
//        return headView
//    }
    
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
    
    @objc override func getData(_ :UIRefreshControl) {
        self.refreshControl?.endRefreshing()
    }

}
