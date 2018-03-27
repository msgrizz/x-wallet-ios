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
import NVActivityIndicatorView
class XWWebViewController: UIBaseViewController,WKNavigationDelegate {
    var webView: WKWebView!
    open var launchURL: String!
    var activityIndicatorView: NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        webView.navigationDelegate = self
        let bridge = ZHWebViewBridge<WKWebView>.bridge(webView)
        bridge.registerHandler("Image.updatePlaceHolder") { (args:[Any]) -> (Bool, [Any]?) in
            return (true, ["place_holder.png"])
        }
        
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 40), type: NVActivityIndicatorType.lineScale)
        activityIndicatorView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
        activityIndicatorView.color = Colors.tintColor
        self.view.addSubview(activityIndicatorView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadURL()
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
