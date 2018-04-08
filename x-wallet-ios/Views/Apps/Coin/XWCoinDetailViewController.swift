//
//  XWCoinDetailViewController.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/28.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import Kingfisher
class XWCoinDetailViewController: UIBaseViewController {
    @IBOutlet weak var coinView: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var headImage: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    var coinPool: SMiniCoinPool!
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
        
        self.coinView.kf.setImage(with: URL(string: coinPool.logo!))
        self.coinNameLabel.text = coinPool.name!
        self.countLabel.text = "\(self.coinPool.own!)/\(self.coinPool.fixed!)"
        self.userNameLabel.text = self.coinPool.issuer?.loginName!
        self.headImage.kf.setImage(with: URL(string: (self.coinPool.issuer?.avatar)!), for: UIControlState.normal)
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
