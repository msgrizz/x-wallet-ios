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
        let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.rootViewController = main.instantiateInitialViewController();
    }
    
    @IBAction func createAction(_ button: UIButton) {
        let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.rootViewController = main.instantiateInitialViewController();
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
