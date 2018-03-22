//
//  XWProtectViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/22.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class XWProtectViewController: UIBaseViewController {
    @IBOutlet weak var firstQView: UIView!
    @IBOutlet weak var firstAView: UIView!
    @IBOutlet weak var secondQView: UIView!
    @IBOutlet weak var secondAView: UIView!
    @IBOutlet weak var thirdQView: UIView!
    @IBOutlet weak var thirdAView: UIView!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var alertLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstQView.layer.cornerRadius = 8
        firstAView.layer.cornerRadius = 8

        secondQView.layer.cornerRadius = 8
        secondAView.layer.cornerRadius = 8
        
        thirdQView.layer.cornerRadius = 8
        thirdAView.layer.cornerRadius = 8

        self.switchButton.isOn = Defaults[.isOpenProtect]
        openProtect(switchButton)
        
        self.title = NSLocalizedString("Password Protection", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openProtect(_ : UISwitch) {
        if switchButton.isOn {
            firstQView.isHidden = false
            firstAView.isHidden = false
            
            secondQView.isHidden = false
            secondAView.isHidden = false
            
            thirdQView.isHidden = false
            thirdAView.isHidden = false
            
            alertLabel.text = NSLocalizedString("请在10个问题中任选3个回答，请务必牢记你的回答", comment: "")
            
            Defaults[.isOpenProtect] = true

        }else {
            firstQView.isHidden = true
            firstAView.isHidden = true
            
            secondQView.isHidden = true
            secondAView.isHidden = true
            
            thirdQView.isHidden = true
            thirdAView.isHidden = true
            
            alertLabel.text = NSLocalizedString("为保护你的账号安全，请开启密码保护", comment: "")
            
            Defaults[.isOpenProtect] = false
        }
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
