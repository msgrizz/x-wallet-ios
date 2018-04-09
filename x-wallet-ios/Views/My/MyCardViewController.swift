//
//  MyCardViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/12.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
class MyCardViewController: UIBaseViewController {
    var editButton: UIBarButtonItem!
    
    let content = """
    So you have heard about this site or you have been to it, but you cannot figure out what it is or what it can do. MTA web directory is the simplest way in which one can bid on a link, or a few links if they wish to do so. The link directory on MTA displays all of the links it currently has, and does so in alphabetical order, which makes it much easier for someone to find what they are looking for if it is something specific and they do not want to go through all the other sites and links as well. It allows you to start your bid at the bottom and slowly work your way to the top of the list. With a very low costing starting bid of just $1, you are guaranteed to have a spot in MTA’s successful directory list.  When you would like to increase your bid to one of the top positions, you have to know that this would be a wise decision to make as it will not only get your link to be at a higher point in the directory but it will also give you a chance to have your site advertised with the rest of the top ten on the home page of the website. This means that when visitors come to MTAweb.com, your site will be one of the first things they see. In other words, you stand a great chance at getting a comeback to your site sooner than you thought.
    
    It is important that you buy links because the links are what get you the results that you want. The popularity of the links that are listed in the MTA directory is in fact one of the most important factors in the performance of the search engine. Links are important and this is why you have to purchase a link in order to bid on something and the best part is that a link will only cost you $1, which is nothing compared to what you would pay if you decided to do it through any other company or website.
    
    By escalating the quantity of links to your web site, you will be able to have your site listed much higher in all the search engine results. So when your site is looked for on the search engine it will be very easy to come across as it will come up as one of the first. This will bring many more people to your web site as well as increase your Google PageRank. It will also improve on the whole strength of your web site. Making it better, faster and more interesting each time.
"""
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var codeImage: UIImageView!
    @IBOutlet weak var backgroundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = ""
        editButton = UIBarButtonItem(
            image: UIImage.init(named: "editButton"),
            style: .plain,
            target: self,
            action: #selector(edit(_:))
        )
        editButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = editButton
        
        headImage.layer.borderWidth = 3
        headImage.layer.masksToBounds = false
        headImage.layer.borderColor = UIColor.white.cgColor
        headImage.layer.cornerRadius = headImage.frame.height/2
        headImage.clipsToBounds = true
        
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.masksToBounds = false
        backgroundView.layer.borderColor = UIColor.clear.cgColor
        backgroundView.layer.cornerRadius = 8
        backgroundView.clipsToBounds = true
        
        
        
        self.contentLabel.text = content
        
        self.accountLabel.text = XWLocalManager.sharedInstance().localUser.mobile
        self.nameLabel.text = XWLocalManager.sharedInstance().localUser.loginName
        self.emailLabel.text = XWLocalManager.sharedInstance().localUser.email
        self.headImage.kf.setImage(with: URL(string: XWLocalManager.sharedInstance().localUser.avatar!))
        
        self.codeImage.image = UIImage.createQRCode(size: self.codeImage.frame.size.width, dataStr: self.createDataString())
        self.codeImage.backgroundColor = UIColor.clear

    }
    
    func createDataString() -> String {
        let name = XWLocalManager.sharedInstance().localUser.loginName
        let id = XWLocalManager.sharedInstance().localUser.id
        let data = "xwallet://00?name=\(name!)&id=\(id!)&timestamp=\(NSDate().timeIntervalSince1970)"
        return data.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
    }
    
    @objc func edit(_ : UIBarButtonItem) {
        
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
