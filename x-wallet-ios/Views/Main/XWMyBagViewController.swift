//
//  XWMyBagViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/10.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWMyBagViewController: UIBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.title = NSLocalizedString("My Bag", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func importantAction() {
        
    }
    
    @IBAction func travelAction() {
        
    }
    
    @IBAction func certificateAction() {
        
    }
    
    @IBAction func custmiseAction() {
        
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
