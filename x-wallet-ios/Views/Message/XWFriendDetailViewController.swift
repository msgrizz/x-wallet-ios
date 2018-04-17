//
//  XWFriendDetailViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/17.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWFriendDetailViewController: UIBaseViewController {
    
    var user: SAccount?
    
    
    let content = """
    So you have heard about this site or you have been to it, but you cannot figure out what it is or what it can do. MTA web directory is the simplest way in which one can bid on a link, or a few links if they wish to do so. The link directory on MTA displays all of the links it currently has, and does so in alphabetical order, which makes it much easier for someone to find what they are looking for if it is something specific and they do not want to go through all the other sites and links as well. It allows you to start your bid at the bottom and slowly work your way to the top of the list. With a very low costing starting bid of just $1, you are guaranteed to have a spot in MTA’s successful directory list.  When you would like to increase your bid to one of the top positions, you have to know that this would be a wise decision to make as it will not only get your link to be at a higher point in the directory but it will also give you a chance to have your site advertised with the rest of the top ten on the home page of the website. This means that when visitors come to MTAweb.com, your site will be one of the first things they see. In other words, you stand a great chance at getting a comeback to your site sooner than you thought.
"""
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = ""
        
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
        
        self.accountLabel.text = user?.mobile
        self.nameLabel.text = user?.loginName
        self.emailLabel.text = user?.email
        self.headImage.kf.setImage(with: URL(string: (user?.avatar)!))
        self.idLabel.text = "Identity code:"+"\((user?.id)!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFriendAction() {
        let alert = UIAlertController(title: "Add friends", message:"Do you confirm adding \"\((self.user?.loginName)!)\" to your friends?" , preferredStyle: UIAlertControllerStyle.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) { (act) in
            
        }
        alert.addAction(noAction)
        alert.addAction(okAction )
        self.present(alert, animated: true, completion: nil)
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
