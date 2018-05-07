//
//  XWAppsViewController.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/27.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import WebKit
class XWAppsViewController: XWWebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Provider"
        self.launchURL = kMarketURL
        self.loadURL()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func addBackButton() {
        if self.webView.canGoBack {
            self.navigationController?.navigationItem.leftBarButtonItem = self.backButton
        }
    }
    
    override func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        super.webView(webView, didFinish: navigation)
        self.addBackButton()
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
