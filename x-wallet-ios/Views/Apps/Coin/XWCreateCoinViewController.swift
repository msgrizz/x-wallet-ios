//
//  XWCreateCoinViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding
class XWCreateCoinViewController: UIBaseViewController {
    @IBOutlet weak var avoidingView:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Coin"
        // Do any additional setup after loading the view.
        KeyboardAvoiding.setAvoidingView(self.view, withTriggerView: self.avoidingView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func issueAction(_ : UIButton) {
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let contact = Main.instantiateViewController(withIdentifier: "XWContactListTableViewController")
        let navi = UIBaseNavigationViewController(rootViewController: contact)
        self.navigationController?.present(navi, animated: true, completion: {
            
        })
    }
    
    @IBAction func addImageAction(_ : UIButton) {
        
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
