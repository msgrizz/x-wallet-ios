//
//  XWMessageViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/23.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import Photos
import CoreLocation


class XWMessageViewController: UIBaseTableViewController, UITextFieldDelegate,  UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {
    
    let barHeight: CGFloat = 50

    @IBOutlet var inputBar: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    override var inputAccessoryView: UIView? {
        get {
            self.inputBar.frame.size.height = self.barHeight
            self.inputBar.clipsToBounds = true
            return self.inputBar
        }
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    let locationManager = CLLocationManager()
    let imagePicker = UIImagePickerController()
    var items = [MessageViewModel]()
    var canSendLocation = true
    var currentUser: XWUser?

    //MARK: Methods
    func customization() {
        self.imagePicker.delegate = self
        self.tableView.estimatedRowHeight = self.barHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.contentInset.bottom = self.barHeight
        self.tableView.scrollIndicatorInsets.bottom = self.barHeight
        self.locationManager.delegate = self
        inputTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("", comment: ""),
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        inputTextField.textColor = UIColor.white
    }
    
    func checkLocationPermission() -> Bool {
        var state = false
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            state = true
        case .authorizedAlways:
            state = true
        default: break
        }
        return state
    }
    
    //MARK: NotificationCenter handlers
    @objc func showKeyboard(notification: Notification) {
        if let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            self.tableView.contentInset.bottom = height
            self.tableView.scrollIndicatorInsets.bottom = height
            if self.items.count > 0 {
                self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.composeMessage(type: .text, content: textField.text!)
        return true
    }
    
    func composeMessage(type: MessageType,content: String)  {
        let message = MessageViewModel.init(owner: .receiver,type: type,name:"asdads",content: content ,  timestamp: Int(Date().timeIntervalSince1970),headImage: self.currentUser?.profilePic)
        self.items.append(message)
        self.tableView.reloadData()
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
////            self.composeMessage(type: .photo, content: pickedImage)
//        } else {
//            let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
////            self.composeMessage(type: .photo, content: pickedImage)
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        self.locationManager.stopUpdatingLocation()
//        if let lastLocation = locations.last {
//            if self.canSendLocation {
//                let coordinate = String(lastLocation.coordinate.latitude) + ":" + String(lastLocation.coordinate.longitude)
////                let message = Message.init(type: .location, content: coordinate, owner: .sender, timestamp: Int(Date().timeIntervalSince1970), isRead: false)
////                Message.send(message: message, toID: self.currentUser!.id, completion: {(_) in
////                })
//                self.canSendLocation = false
//            }
//        }
//    }
    
    
    //MARK: ViewController lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
        NotificationCenter.default.addObserver(self, selector: #selector(XWMessageViewController.showKeyboard(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentUser=XWUser.init(name: "123", email: "linkio.hu@gmail.com", id: "122355", profilePic: UIImage(named: "defaultHead")!)
        self.inputBar.backgroundColor = Colors.backGroundColor
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.customization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.items[indexPath.row].owner == .receiver{
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWRecieverTableViewCell", for: indexPath) as! XWRecieverTableViewCell
            cell.clearCellData()
            if self.items[indexPath.row].type == .text {
                cell.message.text = self.items[indexPath.row].content
//            case .photo:
//                if let image = self.items[indexPath.row].image {
//                    cell.messageBackground.image = image
//                    cell.message.isHidden = true
//                } else {
//                    cell.messageBackground.image = UIImage.init(named: "loading")
//                    self.items[indexPath.row].downloadImage(indexpathRow: indexPath.row, completion: { (state, index) in
//                        if state == true {
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
//                        }
//                    })
//                }
//            case .location:
//                cell.messageBackground.image = UIImage.init(named: "location")
//                cell.message.isHidden = true
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWSenderTableViewCell", for: indexPath) as! XWSenderTableViewCell
            cell.clearCellData()
//            cell.profilePic.image = self.currentUser?.profilePic
            if self.items[indexPath.row].type == .text {
                cell.message.text = self.items[indexPath.row].content
//            case .photo:
//                if let image = self.items[indexPath.row].image {
//                    cell.messageBackground.image = image
//                    cell.message.isHidden = true
//                } else {
//                    cell.messageBackground.image = UIImage.init(named: "loading")
//                    self.items[indexPath.row].downloadImage(indexpathRow: indexPath.row, completion: { (state, index) in
//                        if state == true {
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
//                        }
//                    })
//                }
//            case .location:
//                cell.messageBackground.image = UIImage.init(named: "location")
//                cell.message.isHidden = true
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.inputTextField.resignFirstResponder()
//        switch self.items[indexPath.row].type {
//        case .photo:
//            if let photo = self.items[indexPath.row].image {
//                let info = ["viewType" : ShowExtraView.preview, "pic": photo] as [String : Any]
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showExtraView"), object: nil, userInfo: info)
//                self.inputAccessoryView?.isHidden = true
//            }
//        case .location:
//            let coordinates = (self.items[indexPath.row].content as! String).components(separatedBy: ":")
//            let location = CLLocationCoordinate2D.init(latitude: CLLocationDegrees(coordinates[0])!, longitude: CLLocationDegrees(coordinates[1])!)
//            let info = ["viewType" : ShowExtraView.map, "location": location] as [String : Any]
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showExtraView"), object: nil, userInfo: info)
//            self.inputAccessoryView?.isHidden = true
//        default: break
//        }
    }
}
