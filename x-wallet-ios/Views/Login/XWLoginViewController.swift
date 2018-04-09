//
//  LoginViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/7.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class XWLoginViewController: UIBaseViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Enter User Name", comment: ""),
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Enter Password", comment: ""),
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInAction(_ button: UIButton) {
        nameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        if self.nameTextField.text != "" && self.passwordTextField.text != ""{
            self.activityIndicatorView.startAnimating()
            self.loginRequest()
        } else {
            self.view.makeToast(NSLocalizedString("No User Name Or Password", comment: ""))
        }
    }
    
    @IBAction func createAction(_ button: UIButton) {
        nameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        if self.nameTextField.text != "" && self.passwordTextField.text != ""{
            self.activityIndicatorView.startAnimating()
            self.createRequest()
        }else {
            self.view.makeToast(NSLocalizedString("No User Name Or Password", comment: ""))
        }
    }
    
    func loginRequest() {
        let localAccount = SignInDTO(loginName: self.nameTextField.text, loginPass: self.passwordTextField.text)
        SAccountControllerAPI.signInUsingPOST(signInDTO: localAccount) { (account, error) in
            if (account?.succ)! {
                self.activityIndicatorView.stopAnimating()
                if account != nil {
                    let userId = account?.data?.id
                    Defaults[.userId] = Double(userId!)
                    Defaults[.isLogin] = true
                    XWLocalManager.sharedInstance().localUser = account?.data!
                    self.goToMain()
                }
            }else {
                self.view.makeToast(account?.msg)
            }
        }
    }

    func createRequest() {
        let localAccount = SAccountDTO(loginName: self.nameTextField.text, nickname: self.nameTextField.text, loginPass: self.passwordTextField.text, paymentPass: nil, mobile: nil, email: nil, about: nil, avatar: "http://oss.iclass.cn/image/smallfiles/448_448/1522824152263aiaxp.png", credit: nil)
        SAccountControllerAPI.postUsingPOST(sAccountDTO: localAccount) { (account, error) in
            self.activityIndicatorView.stopAnimating()
            if account != nil {
                let userId = account?.id
                Defaults[.userId] = Double(userId!)
                Defaults[.isLogin] = true
                XWLocalManager.sharedInstance().localUser = account
                self.goToMain()
            }
        }
    }
    
    func goToMain() {
        DispatchQueue.main.async {
            let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
            myAppdelegate.window?.rootViewController = main.instantiateInitialViewController();
        }
    }

}

extension XWLoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("", comment: ""),
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if let text = textField.text, text.isEmpty
        {
            if textField == nameTextField{
                nameTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Enter User Name", comment: ""),
                                                                         attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
            } else {
                passwordTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Enter Password", comment: ""),
                                                                             attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            nameTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
            self.loginRequest()
        }
        return true
    }
}
