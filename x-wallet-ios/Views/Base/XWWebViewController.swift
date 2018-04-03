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
class XWWebViewController: UIBaseViewController,WKNavigationDelegate {
    var webView: WKWebView!
    open var launchURL: String!
    
    var bridge:ZHWebViewBridge<WKWebView>!

    
    var isCreate = false {
        didSet {
            if self.isCreate {
                let trackButton = UIBarButtonItem(
                    title: "Save",
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
                contact.blockproerty={ (name) in
                    DispatchQueue.main.async {
                        contact.dismiss(animated: true, completion: nil)
                        self.bridge.callJsHandler("Person.selectCallback", args: [name], callback: nil)
                        print(name)
                    }
                }
                let navi = UIBaseNavigationViewController(rootViewController: contact)
                self.navigationController?.present(navi, animated: true, completion: {
        
                })
            }
            return (true, [])
        }
        
        bridge.registerHandler("Push.transfer") { (args:[Any]) -> (Bool, [Any]?) in
            DispatchQueue.main.async {
                let vc = self.navigationController?.viewControllers[1] as! XWCoinListTableViewController
                self.navigationController?.popToViewController(vc, animated: true)
            }
            return (true, nil)
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
        self.navigationController?.popViewController(animated: true)
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
