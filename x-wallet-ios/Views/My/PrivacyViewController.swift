//
//  PrivacyViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/12.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import AAPhotoCircleCrop
import SwiftyUserDefaults
import Alamofire
class PrivacyViewController: UIBaseViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate,AACircleCropViewControllerDelegate {
    var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var headView: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    var imageData: Data!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        // Do any additional setup after loading the view.
        
        headView.layer.masksToBounds = false
        headView.layer.borderColor = UIColor.white.cgColor
        headView.layer.cornerRadius = headView.frame.height/2
        headView.clipsToBounds = true
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Pravicy"
        saveButton = UIBarButtonItem.init(title: "Save", style: .plain, target: self, action: #selector(save(_:)))
        saveButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = saveButton
        self.configData()
    }
    
    func configData() {
        self.idLabel.text = "ID:   "+(XWLocalManager.sharedInstance().localUser.loginName)!
        self.nameLabel.text = "Name:   "+(XWLocalManager.sharedInstance().localUser.nickname)!
        self.numberLabel.text = "Number:   "+((XWLocalManager.sharedInstance().localUser.mobile) ?? "")
        self.mailLabel.text = "Mail:   "+((XWLocalManager.sharedInstance().localUser.email) ?? "")
        self.aboutTextView.text = XWLocalManager.sharedInstance().localUser.about ?? ""
        self.headView.kf.setImage(with: URL(string: XWLocalManager.sharedInstance().localUser.avatar!), for: .normal)
    }
    
    @objc func save(_: UIBarButtonItem) {
        
    }
    
    @IBAction func changeHead() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cuAction = UIAlertAction(title: "Camera", style: .default, handler: {action in
            DispatchQueue.main.async {
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        })
        let reAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in
            DispatchQueue.main.async {
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        })
        alert.addAction(cancelAction)
        alert.addAction(cuAction)
        alert.addAction(reAction)
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction() {
        Defaults[.isLogin] = false
        Defaults[.userId] = 0
        let login: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.rootViewController = login.instantiateInitialViewController();
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) {
            let circleCropController = AACircleCropViewController()
            circleCropController.image = info[UIImagePickerControllerOriginalImage] as! UIImage
            circleCropController.delegate = self
            self.present(circleCropController, animated: true, completion: nil)
        }
    }
    
    func circleCropDidCancel() {
        print("User canceled the crop flow")
    }
    
    func circleCropDidCropImage(_ image: UIImage) {
        self.headView.setImage(image, for: UIControlState.normal)
        imageData = UIImageJPEGRepresentation(image, 0.4)
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-hh-mm-ss" //Specify your format that you want
        imageName =  "\(dateFormatter.string(from: date))"+"\(arc4random())"+".JPEG"
        self.sendImageDataRequest()
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
            multipartFormData.append(self.imageData, withName: "qqfile", fileName: self.imageName, mimeType: "multipart/form-data")
        }, usingThreshold: UInt64.init(), to: "https://oss.iclass.cn/formFile", method: .post, headers: headers, encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    let info = response.result.value as? Dictionary<String, AnyObject>
                    let url = info!["html"] as? String
                    let account = UpdateSAccountDTO(loginName: (XWLocalManager.sharedInstance().localUser.loginName)!, nickname: XWLocalManager.sharedInstance().localUser.nickname ?? (XWLocalManager.sharedInstance().localUser.loginName)!, mobile: self.numberLabel.text ?? "", email: self.mailLabel.text ?? "", about: self.aboutTextView.text ?? "", avatar: url!)
                    SAccountControllerAPI.putUsingPUT(sAccountDTO: account, id:Int64(Defaults[.userId]), completion: { (acc, err) in
                        XWLocalManager.sharedInstance().localUser = acc
                    })
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
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
