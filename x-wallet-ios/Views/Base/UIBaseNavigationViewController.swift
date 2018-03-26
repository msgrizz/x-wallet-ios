//
//  UIBaseNavigationViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class UIBaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.barTintColor = Colors.backGroundColor
        self.navigationBar.isTranslucent = false
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationBar.largeTitleTextAttributes  = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationBar.tintColor = Colors.tintColor

        
//        self.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.compact)
//        self.navigationBar.setBarColor(UIColor.clear)
//        self.navigationBar.isTranslucent = true
        
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

}
