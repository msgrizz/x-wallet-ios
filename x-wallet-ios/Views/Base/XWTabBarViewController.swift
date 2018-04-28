//
//  XWTabBarViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWTabBarViewController: UITabBarController,RCIMClientReceiveMessageDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = Colors.tintColor
        self.tabBar.barTintColor = Colors.backGroundColor
        self.tabBar.clipsToBounds = true
        
        RCIMClient.shared().setReceiveMessageDelegate(self, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func onReceived(_ message: RCMessage!, left nLeft: Int32, object: Any!) {
        let text = message.content as! RCTextMessage
        debugPrint(text.extra)
        if let data = message.extra?.data(using: .utf8) {
            let noti = try? JSONDecoder().decode(XWMessageExtraModel.self, from: data)
            if let nt = noti {
                debugPrint(nt)

            }
        }
    }
}
