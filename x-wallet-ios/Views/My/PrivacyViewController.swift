//
//  PrivacyViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/12.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
class PrivacyViewController: UIBaseViewController {
    var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Pravicy"
        saveButton = UIBarButtonItem.init(title: "Save", style: .plain, target: self, action: #selector(save(_:)))
        saveButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func save(_: UIBarButtonItem) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction() {
        Defaults[.isLogin] = false
        Defaults[.userId] = 0
        let login: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.rootViewController = login.instantiateInitialViewController();
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
