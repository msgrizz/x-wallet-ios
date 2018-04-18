//
//  XWWebViewController.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/20.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import WebKit
import WebViewBridge_Swift
import SnapKit
import Toast_Swift
import SwiftyUserDefaults
import Alamofire
class XWWebViewController: UIBaseViewController,WKNavigationDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var webView: WKWebView!
    open var launchURL: String!
    
    var bridge:ZHWebViewBridge<WKWebView>!
    
    let imagePicker = UIImagePickerController()
    var imageData: Data!
    var imageName: String!
    var imageAddon: String!

    var isCreate = false {
        didSet {
            if self.isCreate {
                let trackButton = UIBarButtonItem(
                    title: "Send",
                    style: .plain,
                    target: self,
                    action: #selector(save(_:))
                )
                trackButton.tintColor = Colors.tintColor
                self.navigationItem.rightBarButtonItem = trackButton
            }else {
                
            }
        }
    }
    
    var shareType: String! = ""
    
    lazy var backButton: UIBarButtonItem = UIBarButtonItem(
        image: UIImage(named: "backButton"),
        style: .plain,
        target: self,
        action: #selector(back(_:))
    )
    
    lazy var closeButton: UIBarButtonItem = UIBarButtonItem(
        image: UIImage(named: "closeButtons"),
        style: .plain,
        target: self,
        action: #selector(close(_:))
    )
    
    lazy var moreButton: UIBarButtonItem = UIBarButtonItem(
        image: UIImage(named: "moreNavibutton"),
        style: .plain,
        target: self,
        action: #selector(shareAction(_:))
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = false
        webView = WKWebView.init(frame: self.view.bounds)
        self.view.addSubview(webView)
        webView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
        }
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.clear
        webView.navigationDelegate = self
        webView.scrollView.bouncesZoom = false
        
        bridge = ZHWebViewBridge.bridge(webView)
        bridge.registerHandler("Person.select") { (args:[Any]) -> (Bool, [Any]?) in
            DispatchQueue.main.async {
                let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let contact = Main.instantiateViewController(withIdentifier: "XWContactListTableViewController") as! XWContactListTableViewController
                contact.blockproerty={ (user) in
                    DispatchQueue.main.async {
                        contact.dismiss(animated: true, completion: nil)
                        self.bridge.callJsHandler("Person.selectCallback", args: ["\(user.name),\(user.id)"], callback: nil)
                    }
                }
                let navi = UIBaseNavigationViewController(rootViewController: contact)
                self.navigationController?.present(navi, animated: true, completion: {
        
                })
            }
            return (true, [])
        }
        
        bridge.registerHandler("Person.selectMutable") { (args:[Any]) -> (Bool, [Any]?) in
            if let index = args.first as? String , args.count == 1 {
                DispatchQueue.main.async {
                    let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let contact = Main.instantiateViewController(withIdentifier: "XWContactListTableViewController") as! XWContactListTableViewController
                    contact.blockproerty={ (user) in
                        DispatchQueue.main.async {
                            contact.dismiss(animated: true, completion: nil)
                            self.bridge.callJsHandler("Person.selectMutableCallback", args: ["\(index),\(user.name),\(user.id)"], callback: nil)
                        }
                    }
                    let navi = UIBaseNavigationViewController(rootViewController: contact)
                    self.navigationController?.present(navi, animated: true, completion: {
                        
                    })
                }
            }
            return (true, [])
        }
        
        bridge.registerHandler("Push.pop") { (args:[Any]) -> (Bool, [Any]?) in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            return (true, [])
        }
        
        bridge.registerHandler("Get.userId") { (args:[Any]) -> (Bool, [Any]?) in
            return (true, ["\(XWLocalManager.sharedInstance().localUser.loginName!),\(Int64(Defaults[.userId]))"])
        }
        
        bridge.registerHandler("Scan.qr") { (args:[Any]) -> (Bool, [Any]?) in
            DispatchQueue.main.async {
                let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let contact = Main.instantiateViewController(withIdentifier: "XWScanViewController") as! XWScanViewController
                contact.blockproerty={ (result) in
                    DispatchQueue.main.async {
                        contact.dismiss(animated: true, completion: nil)
                        let action = result.removingPercentEncoding!.getHostStringParameter()
                        if action == ScanType.payQRCode.rawValue {
                            let name = result.removingPercentEncoding!.getQueryStringParameter(param: "name")
                            let id = result.removingPercentEncoding!.getQueryStringParameter(param: "id")
                            self.bridge.callJsHandler("Scan.qrCallback", args: ["\(name!),\(id!)"], callback: nil)
                        }else if action == ScanType.infoCode.rawValue {
                            
                        }
                    }
                }
                let navi = UIBaseNavigationViewController(rootViewController: contact)
                self.navigationController?.present(navi, animated: true, completion: {
                    
                })
            }
            return (true, [])
        }
        
        bridge.registerHandler("Push.appStore") { (args:[Any]) -> (Bool, [Any]?) in
            if let index = args.first as? Int , args.count == 1 {
                switch index {
                case 0:
                    let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = Main.instantiateViewController(withIdentifier: "XWCardListTableViewController") as! XWCardListTableViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                case 1:
                    let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = Main.instantiateViewController(withIdentifier: "XWCoinListTableViewController") as! XWCoinListTableViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                case 2:
                    let Membership: UIStoryboard = UIStoryboard(name: "Membership", bundle: nil)
                    self.navigationController?.pushViewController(Membership.instantiateInitialViewController()!, animated: true)
                    break
                case 3:
                    let Ticket: UIStoryboard = UIStoryboard(name: "Ticket", bundle: nil)
                    self.navigationController?.pushViewController(Ticket.instantiateInitialViewController()!, animated: true)
                    break
                case 4:
                    let Academic: UIStoryboard = UIStoryboard(name: "Academic", bundle: nil)
                    self.navigationController?.pushViewController(Academic.instantiateInitialViewController()!, animated: true)
                    break
                case 5:
                    let Health: UIStoryboard = UIStoryboard(name: "Health", bundle: nil)
                    self.navigationController?.pushViewController(Health.instantiateInitialViewController()!, animated: true)
                    break
                case 6:
                    let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = Main.instantiateViewController(withIdentifier: "XWWebViewController") as! XWWebViewController
                    vc.launchURL = kCouponURL
                    vc.title = NSLocalizedString("Coupon",comment: "")
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                case 7:
                    let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = Main.instantiateViewController(withIdentifier: "XWWebViewController") as! XWWebViewController
                    vc.launchURL = kInvoiceURL
                    vc.title = NSLocalizedString("Invoice",comment: "")
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                default:
                    break
                }
            }
            return (true, [])
        }
        
        bridge.registerHandler("Photo.select") { (args:[Any]) -> (Bool, [Any]?) in
            if let index = args.first as? String , args.count == 1 {
                self.imageAddon = index
            }
            
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let cuAction = UIAlertAction(title: "Camera", style: .default, handler: {action in
                DispatchQueue.main.async {
                    self.imagePicker.sourceType = .camera
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
            })
            let reAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in
                DispatchQueue.main.async {
                    self.imagePicker.sourceType = .photoLibrary
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
            })
            alert.addAction(cancelAction)
            alert.addAction(cuAction)
            alert.addAction(reAction)
            self.present(alert, animated: true, completion: nil)
            return (true, [])
        }
        
        bridge.registerHandler("More.getActionType") { (args:[Any]) -> (Bool, [Any]?) in
            if let index = args.first as? String , args.count == 1 {
                self.shareType = index
                if !self.isCreate {
                    self.navigationItem.rightBarButtonItem = self.moreButton
                }
            }
            return (true, [])
        }
        
        self.addBackButton()
        self.loadURL()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    open func loadURL() {
        if self.launchURL != nil {
            self.webView.load(URLRequest(url: URL(string: launchURL)!))
        }
    }
    
    open func addBackButton() {
        self.navigationItem.leftBarButtonItems = [self.backButton,self.closeButton]
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicatorView.stopAnimating()
    }
    
    @objc func save(_ : UIBarButtonItem) {
        self.bridge.callJsHandler("Send.contractCallback", args: [])
    }
    
    @objc func back(_ : UIBarButtonItem) {
        if  self.webView.canGoBack {
            self.webView.goBack()
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func close(_ : UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) {
            
        }
        imageData = UIImageJPEGRepresentation(info[UIImagePickerControllerOriginalImage] as! UIImage, 0.4)
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-hh-mm-ss" //Specify your format that you want
        imageName =  "\(dateFormatter.string(from: date))"+"\(arc4random())"+".JPEG"
        self.sendImageDataRequest()
    }
    
    func sendImageDataRequest() {
        // Add Headers
        let headers = [
            "Content-Type":"multipart/form-data; charset=utf-8; boundary=__X_PAW_BOUNDARY__",
            ]
        
        // Fetch Request
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append("udap".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"source")
            multipartFormData.append("smallfiles".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"bucketName")
            multipartFormData.append("123".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"Filename")
            multipartFormData.append(self.imageData, withName: "qqfile", fileName: self.imageName, mimeType: "multipart/form-data")
        }, usingThreshold: UInt64.init(), to: "https://oss.iclass.cn/formFile", method: .post, headers: headers, encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    let info = response.result.value as? Dictionary<String, AnyObject>
                    let url = info!["html"] as? String
                    self.bridge.callJsHandler("Photo.selectCallback", args: ["\(self.imageAddon!),\(url!)"], callback: nil)

                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    @objc func shareAction(_: UIBarButtonItem) {
        var arrayButton = [[String:String]]()
        if self.shareType.count > 0 {
            if self.shareType.range(of: "Use") != nil {
                arrayButton.append(useDic)
            }
            if self.shareType.range(of: "Delete") != nil {
                arrayButton.append(deleteDic)
            }
            if self.shareType.range(of: "Modify") != nil {
                arrayButton.append(modifyDic)
            }
            if self.shareType.range(of: "Track") != nil {
                arrayButton.append(trackDic)
            }
        }
        
        
        let cards = [
            arrayButton
        ]
        
        let cancelBtn = [
            "title": "Cancel",
            "type": "danger"
        ]
        let mmShareSheet = MMShareSheet.init(title: nil, cards: cards, duration: nil, cancelBtn: cancelBtn)
        mmShareSheet.callBack = { (handler) ->() in
            switch handler {
            case "Use":
                self.shareUse()
                break
            default:
                self.shareDefault()
            }
        }
        mmShareSheet.present()
    }
    
    func shareUse() {
        var url = self.webView.url?.absoluteString
        if url?.range(of: "#") != nil  {
            url = url?.replacingOccurrences(of: "#", with: "")
        }
        let idString = url!.getQueryStringParameter(param: "id")
        let alert = UIAlertController(title: "Use", message: "Attention, are you sure you want to use this coupon？", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Uncertain", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Determine", style: .default, handler: {action in
            let user = UseSCouponDTO(accountId: Int64(Defaults[.userId]))
            SCouponControllerAPI.useSCouponUsingPOST(id: Int64(idString!)!, useSCouponDTO: user, completion: { (suc, error) in
                self.webView.goBack()
            })
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func shareDefault() {
//        let alert = UIAlertController(title: "Attention", message: "Not Open", preferredStyle: UIAlertControllerStyle.alert)
//        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alert.addAction(cancelAction)
//        self.present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
