//
//  XWCreateCoinViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding
import Alamofire
import SwiftyUserDefaults
import Toast_Swift
class XWCreateCoinViewController: UIBaseViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var avoidingView:UITextField!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var coinButton:UIButton!
    
    @IBOutlet weak var limiteButton:UIButton!
    @IBOutlet weak var unlimiteButton:UIButton!
    var imageData: Data!
    var imageURL: String!
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
    
    func sendImageDataRequest() {
        // Add Headers
        let headers = [
            "Content-Type":"multipart/form-data; charset=utf-8; boundary=__X_PAW_BOUNDARY__",
            ]
        
        // Fetch Request
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append("udap".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"source")
            multipartFormData.append("smallfiles".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"bucketName")
            multipartFormData.append("123".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"Filename")
            multipartFormData.append(self.imageData, withName: "qqfile", fileName: URL(fileURLWithPath: self.imageURL).lastPathComponent, mimeType: "multipart/form-data")
        }, usingThreshold: UInt64.init(), to: "https://oss.iclass.cn/formFile", method: .post, headers: headers, encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    let info = response.result.value as? Dictionary<String, AnyObject>
                    let dto = SMiniCoinPoolDTO(important: false, name: self.nameTextField.text, content: "", logo: info!["html"] as? String, fixed: Int64(self.avoidingView.text!), transferable: true, issuer: Int64(Defaults[.userId]), isImportant: false)
                    SMiniCoinPoolControllerAPI.addUsingPOST(m: dto, completion: { (pool, error) in
                        DispatchQueue.main.async {
                            self.activityIndicatorView.stopAnimating()
                            self.navigationController?.popViewController(animated: true)
                        }
                    })
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    
    
    @IBAction func issueAction(_ : UIButton) {
        self.activityIndicatorView.startAnimating()
        self.sendImageDataRequest()
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
        imageData = UIImageJPEGRepresentation(info[UIImagePickerControllerOriginalImage] as! UIImage, 0.4)
        imageURL = (info[UIImagePickerControllerImageURL]as! NSURL).absoluteString
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
