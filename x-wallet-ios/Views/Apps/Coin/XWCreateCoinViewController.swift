//
//  XWCreateCoinViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding
class XWCreateCoinViewController: UIBaseViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var avoidingView:UITextField!
    @IBOutlet weak var coinButton:UIButton!
    
    @IBOutlet weak var limiteButton:UIButton!
    @IBOutlet weak var unlimiteButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Coin"
        // Do any additional setup after loading the view.
        KeyboardAvoiding.setAvoidingView(self.view, withTriggerView: self.avoidingView)
        ICanHas.photos { authorized, status in
            print(authorized ? "You're authorized to access photos!" : "You're not authorized to access photos!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countAction(_ button: UIButton) {
        if button == self.limiteButton {
            self.limiteButton.isSelected = false
            self.unlimiteButton.isSelected = true
            self.avoidingView.isEnabled = true
        }else {
            self.limiteButton.isSelected = true
            self.unlimiteButton.isSelected = false
            self.avoidingView.text = ""
            self.avoidingView.isEnabled = false
        }
    }
    
    @IBAction func issueAction(_ : UIButton) {
        
        let vc = XWWebViewController()
        
        vc.launchURL = kTransferCoinsURL
        vc.title = "Transfer Coins"
        self.navigationController?.pushViewController(vc, animated: true)
        
        

    }
    
    @IBAction func addImageAction(_ : UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) {
            
        }
        coinButton.setImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.avoidingView.resignFirstResponder()
        return true
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
