//
//  XWFriendDetailViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/17.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
class XWFriendDetailViewController: UIBaseViewController {
    
    var userId: Int64!
    var user: SAccount?
    
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
        
        self.getUserData()z
    }
    
    func configUser() {
        self.accountLabel.text = user?.mobile
        self.nameLabel.text = user?.loginName
        self.emailLabel.text = user?.email
        self.headImage.kf.setImage(with: URL(string: (user?.avatar)!))
        self.idLabel.text = "Identity code:"+"\((user?.id)!)"
        self.contentLabel.text = user?.about
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFriendAction() {
        let alert = UIAlertController(title: "Add friends", message:"Do you confirm adding \"\((self.user?.loginName)!)\" to your friends?" , preferredStyle: UIAlertControllerStyle.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) { (act) in
            let addDTO = AddFriendDTO(accountId: Int64(Defaults[.userId]), friendId: self.user?.id)
            self.activityIndicatorView.startAnimating()
            FriendshipControllerAPI.addFriendsUsingPOST(addFriendDTO: addDTO, completion: { (suc, error) in
                self.activityIndicatorView.stopAnimating()
                guard !suc! else {
                    return
                }
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            })
            
        }
        alert.addAction(noAction)
        alert.addAction(okAction )
        self.present(alert, animated: true, completion: nil)
    }
    
    func getUserData() {
        self.activityIndicatorView.startAnimating()
        SAccountControllerAPI.getOneUsingGET(id: userId) { (account, error) in
            if error != nil {
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }else {
                self.user = account
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.configUser()
                }
            }
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
