//
//  XWCardListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/16.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
class XWCardListTableViewController: UIBaseTableViewController,UIActionSheetDelegate {
    
    var lastScrollOffset: CGFloat = 0
    
    var isScrollDown: Bool = true

    var searchButton: UIBarButtonItem!
    
    var addMoreButton:UIButton!

    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var addButton:UIButton!
    
    var iouArray:  [XWContract] = [XWContract]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UINib(nibName: "XWContractDemoTableViewCell", bundle: nil), forCellReuseIdentifier: "XWContractDemoTableViewCell")
        self.tableView.register(UINib(nibName: "XWIOUTableViewCell", bundle: nil), forCellReuseIdentifier: "XWIOUTableViewCell")
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
        let alertSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle:nil , otherButtonTitles:"Currency","Receipt", "Promise",NSLocalizedString("I.O.U", comment: ""))
        alertSheet.show(in: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.addMoreButton.removeFromSuperview()
        self.isScrollDown = true
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.view.addSubview(self.addMoreButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.activityIndicatorView.startAnimating()
        self.getIOUData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        }else if section == 1{
            return 1
        }else if section == 2{
            return 2
        }else {
            return self.iouArray.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractDemoTableViewCell", for: indexPath) as! XWContractDemoTableViewCell
            if indexPath.row == 0 {
                cell.backImageView.image = UIImage(named: "card1")
            }else {
                cell.backImageView.image = UIImage(named: "card2")
            }
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractDemoTableViewCell", for: indexPath) as! XWContractDemoTableViewCell
            cell.backImageView.image = UIImage(named: "card3")
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractDemoTableViewCell", for: indexPath) as! XWContractDemoTableViewCell
            if indexPath.row == 0 {
                cell.backImageView.image = UIImage(named: "card4")
            }else {
                cell.backImageView.image = UIImage(named: "card5")
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWIOUTableViewCell", for: indexPath) as! XWIOUTableViewCell
            let iou = self.iouArray[indexPath.row]
            cell.timeLabel.text = iou.content
            cell.titleLabel.text = iou.title
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isScrollDown {
            self.tableView.bringSubview(toFront: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Main.instantiateViewController(withIdentifier: "XWMessageViewController") as! XWMessageViewController
        if indexPath.section == 0 {
            let data = XWContract.init(title: "Currency", type: .Currency, content: "Currency")
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.section == 1{
            let data = XWContract.init(title: "Receipt", type: .Receipt, content: "Receipt")
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.section == 2{
            let data = XWContract.init(title: "Promise", type: .Promise, content: "Promise")
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            let data = self.iouArray[indexPath.row]
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = XWContractHeadView.fromNib()
        headView.clearData()
        if section==0 {
            headView.titleLabel.text = "Currency"
            headView.starButton.isHidden = false
            headView.checkButton.isHidden = false
            let tap1 = UITapGestureRecognizer.init(target: self, action: #selector(goToImportant))
            headView.addGestureRecognizer(tap1)
        }else if section == 1{
            headView.titleLabel.text = "Receipt"
        }else if section == 2{
            headView.titleLabel.text = "Promise"
        }else{
            headView.titleLabel.text = NSLocalizedString("I.O.U", comment: "")
        }
        return headView
    }
    
    @objc func goToImportant() {
        self.performSegue(withIdentifier: "goToImportant", sender: nil)
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
        vc.isCreate = true
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
            vc.launchURL = kCreateIOUURL
            vc.title = NSLocalizedString("Create I.O.U",comment: "")
            self.navigationController?.pushViewController(vc, animated: true)

        }else if buttonIndex == 5{


        }
        else {
        }
        
    }
    
    func getIOUData() {
        SMiniContractControllerAPI.getByTypeUsingGET(miniContractType: .iou, accountId: Int64(Defaults[.userId])) { (data, error) in
            guard data != nil else {
                return
            }
            self.iouArray.removeAll()
            for ele in data! {
                let date = Date(timeIntervalSince1970: Double(ele.createTime!)/1000)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy" //Specify your format that you want
                
                var title = ""
                if ele.receiver?.id == Int64(Defaults[.userId]) {
                    title = "From: \(ele.sender!.loginName!)"
                }else {
                    title = "To: \(ele.receiver!.loginName!)"
                }
                
                let iou = XWContract(title: title, type: ContractType.IOU, content: dateFormatter.string(from: date), id:ele.id!)
                self.iouArray.append(iou)
            }
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
        }
    }

}
