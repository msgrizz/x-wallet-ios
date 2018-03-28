//
//  XWCoinDetailViewController.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/28.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWCoinDetailViewController: UIBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let trackButton = UIBarButtonItem(
            title: "Track",
            style: .plain,
            target: self,
            action: #selector(track(_:))
        )
        trackButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = trackButton
    }
    
    @objc func track(_ : UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToTrack", sender: nil)
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
