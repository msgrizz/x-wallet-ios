//
//  XWMainViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import DynamicBlurView
import SnapKit
import SwiftyUserDefaults
class XWMainViewController: UIBaseViewController,UIActionSheetDelegate {
    let defaultHeight: CGFloat = 140
    let defaultHeadHeight: CGFloat = 25

    
    var slideView: XWSlideView!
    var blurView: DynamicBlurView!
    var addButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [XWAppModel] = [XWAppModel]()
//    var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Wallet", comment: "")
        searchBar.backgroundColor=UIColor.clear
        searchBar.placeholder = NSLocalizedString("Search", comment: "")
        
        addButton = UIBarButtonItem(
            image: UIImage.init(named: "newMessage"),
            style: .plain,
            target: self,
            action: #selector(add(_:))
        )
        addButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = addButton
        
        slideView = XWSlideView.fromNib()
        slideView.frame = UIScreen.main.bounds
        slideView.closeButton.addTarget(self, action: #selector(dismissSlide(_ :)), for: .touchUpInside)
        slideView.alpha = 0
        
        let contract = UITapGestureRecognizer.init(target: self, action: #selector(addContractAction(_:)))
        slideView.miniContract.addGestureRecognizer(contract)
        
        let token = UITapGestureRecognizer.init(target: self, action: #selector(addCoinAction(_:)))
        slideView.coin.addGestureRecognizer(token)
        
        let code = UITapGestureRecognizer.init(target: self, action: #selector(goToCode(_:)))
        slideView.receiveCode.addGestureRecognizer(code)
        
        let sacn = UITapGestureRecognizer.init(target: self, action: #selector(goToScan(_:)))
        slideView.scan.addGestureRecognizer(sacn)
        
        blurView = DynamicBlurView(frame: slideView.bounds)
        
        self.tableView.register(UINib(nibName: "XWCardTableViewCell", bundle: nil), forCellReuseIdentifier: "XWCardTableViewCell")
        self.tableView.register(UINib(nibName: "XWMyBagTableViewCell", bundle: nil), forCellReuseIdentifier: "XWMyBagTableViewCell")
        
        self.getAppsData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAppRect(cardNum: Int) -> CGRect {
        return CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: CGFloat(52 + 14 + cardNum * 46))
    }
    
    @objc func add(_ : UIBarButtonItem) {
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.addSubview(self.blurView)
        myAppdelegate.window?.addSubview(slideView)
        UIView.animate(withDuration: 0.5) {
            self.blurView.blurRadius = 30
            self.slideView.alpha = 1
        }
    }
 
    @objc func goToLists(_ : UIButton) {
        self.performSegue(withIdentifier: "goToCardList", sender: nil)
    }
    
    @objc func goToCoin(_ : UIButton) {
        self.performSegue(withIdentifier: "goToCoinList", sender: nil)
    }
    
    @objc func goToMembership(_ : UIButton) {
        let Membership: UIStoryboard = UIStoryboard(name: "Membership", bundle: nil)
        self.navigationController?.pushViewController(Membership.instantiateInitialViewController()!, animated: true)
    }
    
    @objc func goToTicket(_ : UIButton) {
        let Ticket: UIStoryboard = UIStoryboard(name: "Ticket", bundle: nil)
        self.navigationController?.pushViewController(Ticket.instantiateInitialViewController()!, animated: true)
    }
    
    @objc func goToAcademic(_ : UIButton) {
        let Academic: UIStoryboard = UIStoryboard(name: "Academic", bundle: nil)
        self.navigationController?.pushViewController(Academic.instantiateInitialViewController()!, animated: true)
    }
    
    @objc func goToHealth(_ : UIButton) {
        let Health: UIStoryboard = UIStoryboard(name: "Health", bundle: nil)
        self.navigationController?.pushViewController(Health.instantiateInitialViewController()!, animated: true)
    }
    
    @objc func goToCoupon(_ : UIButton) {
        let Coupon: UIStoryboard = UIStoryboard(name: "Coupon", bundle: nil)
        self.navigationController?.pushViewController(Coupon.instantiateInitialViewController()!, animated: true)
    }
    
    @objc func dismissSlide(_ :UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.blurView.blurRadius = 0
            self.slideView.alpha = 0
        }) { (true) in
            self.slideView.removeFromSuperview()
            self.blurView.removeFromSuperview()
        }
    }
    
    @objc func addContractAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())
        let alertSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle:nil , otherButtonTitles:"Currency","Receipt", "Promise",NSLocalizedString("I.O.U", comment: ""))
        alertSheet.show(in: self.view)
    }
    
    @objc func addScanAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())


    }
    
    @objc func addCoinAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Main.instantiateViewController(withIdentifier: "XWCreateCoinViewController") as! XWCreateCoinViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func addCardAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())

    }
    
    @objc func goToCode(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Main.instantiateViewController(withIdentifier: "XWReceiveCodeViewController") as! XWReceiveCodeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToScan(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())
        AVCaptureSessionManager.checkAuthorizationStatusForCamera(grant: {
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "XWScanViewController")
            self.navigationController?.pushViewController(controller, animated: true)
        }){
            let action = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (action) in
                let url = URL(string: UIApplicationOpenSettingsURLString)
                UIApplication.shared.open(url!, options: [String: Any](), completionHandler: nil)
            })
            let con = UIAlertController(title: "权限未开启", message: "您未开启相机权限，点击确定跳转至系统设置开启", preferredStyle: UIAlertControllerStyle.alert)
            con.addAction(action)
            self.present(con, animated: true, completion: nil)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCardList" {
            let vc = segue.destination as! XWCardListTableViewController
            vc.title = "Mini Contract"
        }
    }
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Main.instantiateViewController(withIdentifier: "XWWebViewController") as! XWWebViewController
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
    
    func getAppsData() {
        self.dataArray.removeAll()
        HomeControllerAPI.dashboardUsingGET(accountId: 1) { (datas, error) in
            for ele in datas! {
                let app = XWAppModel()
                app.dataModels = ele.data!
                app.appImage = ele.logo
                app.type = ele.type!
                if ele.data?.count != 0 {
                    self.dataArray.append(app)
                }
            }
            debugPrint(self.dataArray)
            self.tableView.reloadData()
        }
    }
}

extension XWMainViewController: UITabBarDelegate {
    
}

extension XWMainViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let search: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        self.present(search.instantiateInitialViewController() as! UINavigationController, animated: true) {
            
        }
        
        
        return false
    }
}

extension XWMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 47
        }
        
        let model = dataArray[indexPath.row - 1]
        if model.dataModels.count==1 {
            return defaultHeight - defaultHeadHeight * 2
        }else if model.dataModels.count==2 {
            return defaultHeight - defaultHeadHeight
        }else {
            return defaultHeight
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWMyBagTableViewCell", for: indexPath) as! XWMyBagTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWCardTableViewCell", for: indexPath) as! XWCardTableViewCell
            let model = dataArray[indexPath.row-1]
            cell.datas = model
            return cell
        }
    }
}

extension XWMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "goToMyBag", sender: nil)
        }
    }
}
