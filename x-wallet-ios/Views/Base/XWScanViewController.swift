//
//  XWScanViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/22.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWScanViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var sessionManager:AVCaptureSessionManager?
    var link: CADisplayLink?
    var torchState = false
    
    typealias fucBlock = (_ name :String) ->()
    
    @IBOutlet weak var scanTop: NSLayoutConstraint!
    var blockproerty:fucBlock!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        // Do any additional setup after loading the view.
        link = CADisplayLink(target: self, selector: #selector(scan))
        
        sessionManager = AVCaptureSessionManager(captureType: .AVCaptureTypeBoth, scanRect: CGRect.null, success: { (result) in
            if let r = result {
                self.showResult(result: r)
            }
        })
        sessionManager?.showPreViewLayerIn(view: view)
        sessionManager?.isPlaySound = true
        
        let item = UIBarButtonItem(title: NSLocalizedString("Library", comment: ""), style: .plain, target: self, action: #selector(openPhotoLib))
        navigationItem.rightBarButtonItem = item
    }

    override func viewWillAppear(_ animated: Bool) {
        link?.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
        sessionManager?.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        link?.remove(from: RunLoop.main, forMode: RunLoopMode.commonModes)
        sessionManager?.stop()
    }
    
    @objc func scan() {
        scanTop.constant -= 1;
        if (scanTop.constant <= -170) {
            scanTop.constant = 170;
        }
    }
    
    @IBAction func changeState(_ sender: UIButton) {
        torchState = !torchState
        let str = torchState ? "关闭闪光灯" : "开启闪光灯"
        sessionManager?.turnTorch(state: torchState)
        sender.setTitle(str, for: .normal)
    }
    
    
    func showResult(result: String) {
        if let _ = blockproerty{
            blockproerty(result)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func openPhotoLib() {
        AVCaptureSessionManager.checkAuthorizationStatusForPhotoLibrary(grant: {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }) {
            let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (action) in
                let url = URL(string: UIApplicationOpenSettingsURLString)
                UIApplication.shared.openURL(url!)
            })
            let con = UIAlertController(title: "权限未开启",
                                        message: "您未开启相册权限，点击确定跳转至系统设置开启",
                                        preferredStyle: UIAlertControllerStyle.alert)
            con.addAction(action)
            self.present(con, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        sessionManager?.start()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true) {
            self.sessionManager?.start()
            self.sessionManager?.scanPhoto(image: info["UIImagePickerControllerOriginalImage"] as! UIImage, success: { (str) in
                if let result = str {
                    self.showResult(result: result)
                }else {
                    self.showResult(result: "未识别到二维码")
                }
            })
            
        }
    }

}
