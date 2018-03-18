//
//  XWInviteViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/13.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
class XWInviteViewController: UIBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Invite Friends", comment: "")
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.compact)
        self.navigationController?.navigationBar.setBarColor(UIColor.clear)
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        super.viewWillDisappear(animated)
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
