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
    var contractArray:  [XWContract] = [XWContract]()
    var recieptArray:  [XWContract] = [XWContract]()
    var promiseArray:  [XWContract] = [XWContract]()
    
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
        
        addMoreButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.width - 70, y: UIScreen.main.bounds.height - 100, width: 39, height: 39))
        addMoreButton.setImage(UIImage(named: "bottomAdd"), for: .normal)
        addMoreButton.addTarget(self, action: #selector(add(_:)), for: UIControlEvents.touchUpInside)
        
        self.getData(UIRefreshControl())
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

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return self.contractArray.count
        }else if section == 1{
            return self.recieptArray.count
        }else if section == 2{
            return self.promiseArray.count
        }else {
            return self.iouArray.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractTableViewCell", for: indexPath) as! XWContractTableViewCell
            let contract = self.contractArray[indexPath.row]
            cell.titleLabel.text = contract.title
            let partAttribute = [NSAttributedStringKey.foregroundColor: UIColor(hex: "8a8a8f")]
            let nameAttribute = [NSAttributedStringKey.foregroundColor: UIColor(hex: "000000")]
            
            let partA = NSMutableAttributedString(string: "PartA:", attributes: partAttribute)
            partA.append(NSAttributedString(string: contract.partAName!, attributes: nameAttribute))
            
            let partB = NSMutableAttributedString(string: "PartB:", attributes: partAttribute)
            partB.append(NSAttributedString(string: contract.partBName!, attributes: nameAttribute))
            
            cell.partALabel.attributedText = partA
            cell.partBLabel.attributedText = partB
            
            cell.tagButton.isHidden = !contract.isImportant
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWReceiptTableViewCell", for: indexPath) as! XWReceiptTableViewCell
            let reciept = self.recieptArray[indexPath.row]
            cell.timeLabel.text = reciept.content
            cell.titleLabel.text = reciept.title
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWPromiseTableViewCell", for: indexPath) as! XWPromiseTableViewCell
            let promise = self.promiseArray[indexPath.row]
            cell.detailLabel.text = promise.title
            cell.partAName.text = promise.partAName
            cell.partBName.text = promise.partBName
            cell.partAHead.kf.setImage(with: URL(string: promise.partAHead!), for: UIControlState.normal)
            cell.partBHead.kf.setImage(with: URL(string: promise.partBHead!), for: UIControlState.normal)
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
            let data = self.contractArray[indexPath.row]
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.section == 1{
            let data = self.recieptArray[indexPath.row]
            vc.contractModel = data
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.section == 2{
            let data = self.promiseArray[indexPath.row]
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
            if self.completeArray.count > 0 {
                headView.checkButton.isHidden = false
                headView.checkButton.setTitle(" \(self.completeArray.count)", for: UIControlState.normal)
                let tap1 = UITapGestureRecognizer.init(target: self, action: #selector(goToComplete))
                headView.addGestureRecognizer(tap1)
            }
        }else if section == 1{
            headView.titleLabel.text = "Receipt"
        }else if section == 2{
            headView.titleLabel.text = "Promise"
        }else{
            headView.titleLabel.text = NSLocalizedString("I.O.U", comment: "")

        }
        return headView
    }
    
    @objc func goToComplete() {
        self.performSegue(withIdentifier: "goToComplete", sender: nil)
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
    
    @objc override func getData(_ :UIRefreshControl) {
        SMiniContractControllerAPI.sMiniContractsByAccountIdUsingGET(accountId: Int64(Defaults[.userId])) { (data, error) in
            guard data != nil else {
                return
            }
            self.iouArray.removeAll()
            self.contractArray.removeAll()
            self.recieptArray.removeAll()
            self.promiseArray.removeAll()
            self.completeArray.removeAll()
            for ele in data! {
                
                switch ele.miniContractType {
                case .currency?:
                    let currency = XWContract(title: ele.title!, type: ContractType.Currency, content: ele.content!, id:ele.id!)
                    currency.partAName = ele.sender?.loginName
                    currency.partBName = ele.receiver?.loginName
                    currency.remoteData = ele
                    currency.isImportant = ele.important!
                    if ele.receiverComplete! && ele.senderComplete! {
                        self.completeArray.append(currency)
                    }else {
                        self.contractArray.append(currency)
                    }
                    break
                case .receipt?:
                    let date = Date(timeIntervalSince1970: Double(ele.createTime!)/1000)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy" //Specify your format that you want
                    
                    var title = ""
                    if ele.receiver?.id == Int64(Defaults[.userId]) {
                        if ele.sender != nil {
                            title = "From: \(ele.sender!.loginName!)"
                        }
                    }else {
                        if ele.receiver != nil {
                            title = "To: \(ele.receiver!.loginName!)"
                        }
                    }
                    let receipt = XWContract(title: title, type: ContractType.Receipt, content: dateFormatter.string(from: date), id:ele.id!)
                    receipt.remoteData = ele
                    if ele.receiverComplete! && ele.senderComplete! {
                        self.completeArray.append(receipt)
                    }else {
                        self.recieptArray.append(receipt)
                    }
                    break
                case .promise?:
                    let promise = XWContract(title: ele.title!, type: ContractType.Promise, content: ele.content!, id:ele.id!)
                    promise.partAName = ele.sender?.loginName
                    promise.partBName = ele.receiver?.loginName
                    promise.partAHead = ele.sender?.avatar
                    promise.partBHead = ele.sender?.avatar
                    promise.remoteData = ele
                    if ele.receiverComplete! && ele.senderComplete! {
                        self.completeArray.append(promise)
                    }else {
                        self.promiseArray.append(promise)
                    }
                    break
                case .iou?:
                    let date = Date(timeIntervalSince1970: Double(ele.createTime!)/1000)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy" //Specify your format that you want
                    
                    var title = ""
                    if ele.receiver?.id == Int64(Defaults[.userId]) {
                        if ele.sender != nil {
                            title = "From: \(ele.sender!.loginName!)"
                        }
                    }else {
                        if ele.receiver != nil {
                            title = "To: \(ele.receiver!.loginName!)"
                        }
                    }
                    let iou = XWContract(title: title, type: ContractType.IOU, content: dateFormatter.string(from: date), id:ele.id!)
                    iou.remoteData = ele
                    iou.isImportant = ele.important!
                    if ele.receiverComplete! && ele.senderComplete! {
                        self.completeArray.append(iou)
                    }else {
                        self.iouArray.append(iou)
                    }
                    break
                default:
                    break
                }
                

            }
            self.isScrollDown = true
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToComplete" {
            let vc = segue.destination as! XWCompleteContractTableViewController
            vc.completeArray = self.completeArray
            vc.title = "Completed"
        }
    }

}
