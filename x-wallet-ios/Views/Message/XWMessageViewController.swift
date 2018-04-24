//
//  XWMessageViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/23.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import Photos
import Kingfisher
import SnapKit
class XWMessageViewController: UIBaseViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate,  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let barHeight: CGFloat = 50
    let moreViewHeight: CGFloat = 110
    
    var showMore = true
    
    var isScrollDown: Bool = true
    var contractModel: XWContract!
    @IBOutlet var inputBar: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var moreActionView: XWInputMoreView!
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    let imagePicker = UIImagePickerController()
    var items = [MessageViewModel]()
    var canSendLocation = true
    var currentUser: XWUser?
    
    @IBOutlet weak var tableView: UITableView!

    //MARK: Methods
    func customization() {
        self.imagePicker.delegate = self
        self.tableView.estimatedRowHeight = self.barHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        inputTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("", comment: ""),
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        inputTextField.textColor = UIColor.white
        
        self.title = NSLocalizedString("Contract Progress", comment: "")
        
        self.moreActionView.frame = CGRect(x: 0, y: 1000, width: kScreenWidth, height: moreViewHeight)
        self.view.addSubview(self.inputBar)
        self.view.addSubview(self.moreActionView)
        self.inputBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(barHeight)
        }
    }
    //MARK: NotificationCenter handlers
    @objc func showKeyboard(notification: Notification) {
        self.moreActionView.isHidden = true
        if let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            
            self.tableView.contentInset.bottom = height + barHeight
            self.tableView.contentInset.top = 10
            self.tableView.scrollIndicatorInsets.bottom = height + barHeight
            
            self.inputBar.snp.remakeConstraints { (make) in
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
                make.height.equalTo(barHeight)
                make.top.equalTo(self.view.frame.size.height - height - barHeight)

            }
            if self.items.count > 0 {
                self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    @objc func dismissKeyboard(notification: Notification) {
        self.moreActionView.isHidden = true
        self.tableView.contentInset.bottom = 0
        self.tableView.contentInset.top = 0
        self.tableView.scrollIndicatorInsets.bottom = 0
        
        self.inputBar.snp.remakeConstraints { (make) in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(barHeight)
            
        }
        if self.items.count > 0 {
            self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        if textField.text == "" {
            return true
        }
        self.composeMessage(type: .text, content: textField.text!)
        textField.text = ""
        return true
    }
    
    func composeMessage(type: MessageType,content: String)  {
        let message = MessageViewModel.init(owner: .receiver,type: type,name:(self.currentUser?.name)!,content: content ,  timestamp: Int(Date().timeIntervalSince1970),headImageURL: self.currentUser?.avatar, imageURL: "http://img4.imgtn.bdimg.com/it/u=1972873509,2904368741&fm=27&gp=0.jpg")
        self.items.append(message)
        self.tableView.insertRows(at: [IndexPath.init(row: self.items.count - 1, section: 0)], with: UITableViewRowAnimation.bottom)
        if self.items.count > 0 {
            self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
//            self.composeMessage(type: .photo, content: "pickedImage")
//        } else {
//            let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//            self.composeMessage(type: .photo, content: "pickedImage")
//        }
//        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK: ViewController lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
        NotificationCenter.default.addObserver(self, selector: #selector(XWMessageViewController.showKeyboard(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(XWMessageViewController.dismissKeyboard(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let entity = XWLocalManager.sharedInstance().getMySelf()
        
        self.currentUser=XWUser(name: entity.nickname ?? "", email: entity.email ?? "", id: "\(entity.id)", profilePic:nil, avatar:entity.avatar)
    
        self.inputBar.backgroundColor = Colors.backGroundColor
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.customization()
        
        let moreButton = UIBarButtonItem(
            image: UIImage(named: "messageMore"), style: .plain, target: self, action: #selector(naviMoreAction(_ :))
        )
        moreButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = moreButton
    }
    
    @objc func naviMoreAction(_ : UIBarButtonItem) {

    }
    
    @IBAction func inputBarMore() {
        self.inputTextField.resignFirstResponder()
        if showMore {
            self.showMoreView()
            self.showMore = false
        }else {
            self.dismissMoreView()
            self.showMore = true
        }
    }
    
    func showMoreView() {
        self.moreActionView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.moreActionView.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                make.height.equalTo(self.moreViewHeight)
            })
            self.inputBar.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
                make.bottom.equalTo(self.moreActionView.snp.top)
                make.height.equalTo(self.moreViewHeight)
            })
        })
    }
    
    func dismissMoreView() {
        self.moreActionView.isHidden = true
        UIView.animate(withDuration: 0.3, animations: {
            self.inputBar.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                make.height.equalTo(self.barHeight)
            })
            self.moreActionView.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
                make.top.equalTo(self.inputBar.snp.bottom)
                make.height.equalTo(self.moreViewHeight)
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.contractModel != nil {
            return self.items.count + 1
        }else {
            return self.items.count
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.contractModel != nil {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractHeadTableViewCell", for: indexPath) as! XWContractHeadTableViewCell
                cell.clearCellData()
                cell.titleLabel.text = self.contractModel.title
                if self.contractModel.remoteData != nil {
                    if self.contractModel.remoteData?.content != nil {
                        cell.contentLabel.text = (self.contractModel.remoteData?.content)! + "\n\n"
                    }
                    cell.signButton.isHidden = false
                    cell.sender.kf.setImage(with: URL(string: (self.contractModel.remoteData?.sender?.avatar)!), for: UIControlState.normal)
                    cell.reciever.kf.setImage(with: URL(string: (self.contractModel.remoteData?.receiver?.avatar)!), for: UIControlState.normal)
                    cell.senderCheck.isHidden = !(self.contractModel.remoteData?.senderConfirmed)!
                    cell.recieverCheck.isHidden = !(self.contractModel.remoteData?.receiverConfirmed)!
                    cell.signButton.setAttributedTitle(nil, for: UIControlState.normal)
                    cell.signButton.setTitle(" " + (self.contractModel.remoteData?.sender?.loginName)! + " proposed contract and signed it", for: UIControlState.normal)
                    cell.timeLabel.text = self.contractModel.content
                }
                return cell
            }
            else {
                let message = self.items[indexPath.row - 1]
                if message.owner == .receiver{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "XWRecieverTableViewCell", for: indexPath) as! XWRecieverTableViewCell
                    self.configRecieverCell(cell, message: message)
                    return cell
                }
                else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "XWSenderTableViewCell", for: indexPath) as! XWSenderTableViewCell
                    cell.clearCellData()
                    self.configSenderCell(cell, message: message)
                    return cell
                }
            }
        }else {
            let message = self.items[indexPath.row]
            if message.owner == .receiver{
                let cell = tableView.dequeueReusableCell(withIdentifier: "XWRecieverTableViewCell", for: indexPath) as! XWRecieverTableViewCell
                self.configRecieverCell(cell, message: message)
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "XWSenderTableViewCell", for: indexPath) as! XWSenderTableViewCell
                cell.clearCellData()
                self.configSenderCell(cell, message: message)
                return cell
            }
        }
    }
    
    func configSenderCell(_ cell:XWSenderTableViewCell ,message: MessageViewModel) {
        cell.clearCellData()
        if message.type == .text {
            cell.message.text = message.content
            cell.profilePic.kf.setImage(with: URL(string: message.headImageURL!))
            cell.nameLabel.text = message.name
        }
        else if message.type == .photo {
            if let url = message.imageURL {
                cell.messageBackground.kf.setImage(with: URL(string: url))
                cell.message.isHidden = true
                cell.profilePic.kf.setImage(with: URL(string: message.headImageURL!))
                cell.nameLabel.text = message.name
            }
        }else if message.type == .voice {
            
        }else if message.type == .card {
            
        }
    }
    
    func configRecieverCell(_ cell:XWRecieverTableViewCell ,message: MessageViewModel) {
        cell.clearCellData()
        if message.type == .text {
            cell.message.text = message.content
            cell.profilePic.kf.setImage(with: URL(string: message.headImageURL!))
            cell.nameLabel.text = message.name
        }
        else if message.type == .photo {
            if let url = message.imageURL {
                cell.messageBackground.kf.setImage(with: URL(string: url))
                cell.message.isHidden = true
                cell.profilePic.kf.setImage(with: URL(string: message.headImageURL!))
                cell.nameLabel.text = message.name
            }
        }else if message.type == .voice {
            
        }else if message.type == .card {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.contractModel != nil {
            if indexPath.row == 0 {
                let vc = XWWebViewController()
                if self.contractModel.type == .Currency {
                    vc.launchURL = kMiniContractURL+"?id=\(self.contractModel.id!)"
                    vc.title = "Currency"
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if self.contractModel.type == .Receipt {
                    vc.launchURL = kReceiptURL+"?id=\(self.contractModel.id!)"
                    vc.title = "Receipt"
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if self.contractModel.type == .Promise {
                    vc.launchURL = kPromiseURL+"?id=\(self.contractModel.id!)"
                    vc.title = "Promise"
                    self.navigationController?.pushViewController(vc, animated: true)
                }else {
                    vc.launchURL = kIOUURL+"?id=\(self.contractModel.id!)"
                    vc.title = NSLocalizedString("I.O.U", comment: "")
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        self.inputTextField.resignFirstResponder()
    }
}
