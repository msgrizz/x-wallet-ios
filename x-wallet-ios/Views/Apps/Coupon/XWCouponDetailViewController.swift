//
//  XWCouponDetailViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/8.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWCouponDetailViewController: UIBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let trackButton = UIBarButtonItem(
            title: "Use",
            style: .plain,
            target: self,
            action: #selector(use(_:))
        )
        trackButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = trackButton
    }
    
    @objc func use(_ : UIBarButtonItem) {
        let alert = UIAlertController(title: "Use", message: "Attention, are you sure you want to use this coupon？", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Uncertain", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Determine", style: .default, handler: {action in
            self.navigationController?.popToRootViewController(animated: true)
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
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
