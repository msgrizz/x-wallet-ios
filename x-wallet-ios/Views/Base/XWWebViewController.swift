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
class XWWebViewController: UIBaseViewController {
    var webView: WKWebView!
    open var launchURL: String!
    
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
        
        let bridge = ZHWebViewBridge<WKWebView>.bridge(webView)
        bridge.registerHandler("Image.updatePlaceHolder") { (args:[Any]) -> (Bool, [Any]?) in
            return (true, ["place_holder.png"])
        }
    }
    
    open func loadURL() {
        self.webView.load(URLRequest(url: URL(string: launchURL)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
