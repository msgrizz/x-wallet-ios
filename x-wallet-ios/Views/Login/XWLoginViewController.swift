//
//  LoginViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/7.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

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
        if self.nameTextField.text != nil && self.passwordTextField.text != nil {
            self.activityIndicatorView.startAnimating()
            self.loginRequest()
        }
    }
    
    @IBAction func createAction(_ button: UIButton) {
        if self.nameTextField.text != nil && self.passwordTextField.text != nil {
            self.activityIndicatorView.startAnimating()
            self.loginRequest()
        }
    }

    func loginRequest() {
        let localAccount = SAccount(about: "", activated: true, avatar: "", createTime: 1, email: "", id: 1, lastModifyTime: 1, loginName: self.nameTextField.text, loginPass: self.passwordTextField.text, mobile: "", nickname: self.nameTextField.text, paymentPass: "", version: 1)
        SAccountEntityAPI.saveSAccountUsingPOST(body: localAccount) { (account, error) in
            print(account)
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func goToMain() {
        let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.rootViewController = main.instantiateInitialViewController();
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
        }
        return true
    }
}
