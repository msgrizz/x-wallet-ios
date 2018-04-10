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

class XWWebViewController: UIBaseViewController,WKNavigationDelegate {
    var webView: WKWebView!
    open var launchURL: String!
    
    var bridge:ZHWebViewBridge<WKWebView>!

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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        // Do any additional setup after loading the view.
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
                        let name = self.getQueryStringParameter(url: result.removingPercentEncoding!, param: "name")
                        let id = self.getQueryStringParameter(url: result.removingPercentEncoding!, param: "id")
                        self.bridge.callJsHandler("Scan.qrCallback", args: ["\(name!),\(id!)"], callback: nil)
                    }
                }
                let navi = UIBaseNavigationViewController(rootViewController: contact)
                self.navigationController?.present(navi, animated: true, completion: {
                    
                })
            }
            return (true, [])
        }
        
        bridge.registerHandler("Scan.qr") { (args:[Any]) -> (Bool, [Any]?) in
            DispatchQueue.main.async {
                let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let contact = Main.instantiateViewController(withIdentifier: "XWScanViewController") as! XWScanViewController
                contact.blockproerty={ (result) in
                    DispatchQueue.main.async {
                        contact.dismiss(animated: true, completion: nil)
                        let name = self.getQueryStringParameter(url: result.removingPercentEncoding!, param: "name")
                        let id = self.getQueryStringParameter(url: result.removingPercentEncoding!, param: "id")
                        self.bridge.callJsHandler("Scan.qrCallback", args: ["\(name!),\(id!)"], callback: nil)
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
                    let Coupon: UIStoryboard = UIStoryboard(name: "Coupon", bundle: nil)
                    self.navigationController?.pushViewController(Coupon.instantiateInitialViewController()!, animated: true)
                    break
                case 7:
                    let Coupon: UIStoryboard = UIStoryboard(name: "Coupon", bundle: nil)
                    self.navigationController?.pushViewController(Coupon.instantiateInitialViewController()!, animated: true)
                    break
                default:
                    break
                }
            }
            
            
            DispatchQueue.main.async {
                let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let contact = Main.instantiateViewController(withIdentifier: "XWScanViewController") as! XWScanViewController
                contact.blockproerty={ (result) in
                    DispatchQueue.main.async {
                        contact.dismiss(animated: true, completion: nil)
                        let name = self.getQueryStringParameter(url: result.removingPercentEncoding!, param: "name")
                        let id = self.getQueryStringParameter(url: result.removingPercentEncoding!, param: "id")
                        self.bridge.callJsHandler("Scan.qrCallback", args: ["\(name!),\(id!)"], callback: nil)
                    }
                }
                let navi = UIBaseNavigationViewController(rootViewController: contact)
                self.navigationController?.present(navi, animated: true, completion: {
                    
                })
            }
            return (true, [])
        }
        
        
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
    
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
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
