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
import Alamofire
class XWMessageViewController: UIBaseViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate,  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    /// 录音框
    private var chatHUD: MCRecordHUD!
    /// HUD类型
    public var HUDType: HUDType = .bar
    /// 录音器
    private var recorder: AVAudioRecorder!
    /// 录音器设置
    private let recorderSetting = [AVSampleRateKey : NSNumber(value: Float(44100.0)),//声音采样率
        AVFormatIDKey : NSNumber(value: Int32(kAudioFormatMPEG4AAC)),//编码格式
        AVNumberOfChannelsKey : NSNumber(value: 1),//采集音轨
        AVEncoderAudioQualityKey : NSNumber(value: Int32(AVAudioQuality.medium.rawValue))]//声音质量
    /// 录音计时器
    private var timer: Timer?
    /// 波形更新间隔
    private let updateFequency = 0.05
    /// 声音数据数组
    private var soundMeters: [Float]!
    /// 声音数据数组容量
    private let soundMeterCount = 10
    /// 录音时间
    private var recordTime = 0.00
    
    @IBOutlet weak var voiceInputButton: UIButton!
    @IBOutlet weak var voiceButton: UIButton!
    
    
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
    var items = [MessageViewModel]()
    var canSendLocation = true
    
    var currentUser: XWUser?
    var targetUser: XWUser?

    
    @IBOutlet weak var tableView: UITableView!
    
    let imagePicker = UIImagePickerController()
    var imageData: Data!
    var imageName: String!

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
        
        chatHUD = MCRecordHUD(type: HUDType)
        configRecord()
        setupButtonEvent() 
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
    
    func composeMessage(type: LocalMessageType,content: String)  {
        let message = MessageViewModel.init(owner: .receiver,type: type,name:(self.currentUser?.name)!,content: content ,  timestamp: Int(Date().timeIntervalSince1970),headImageURL: self.currentUser?.avatar, imageURL: "http://img4.imgtn.bdimg.com/it/u=1972873509,2904368741&fm=27&gp=0.jpg")
        self.items.append(message)
        self.tableView.insertRows(at: [IndexPath.init(row: self.items.count - 1, section: 0)], with: UITableViewRowAnimation.bottom)
        if self.items.count > 0 {
            self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
        }
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
    
    @IBAction func inputBarVoice() {
        self.inputTextField.resignFirstResponder()
        
        if self.voiceButton.isSelected {
            self.voiceButton.isSelected = false
            self.inputTextField.isHidden = false
            self.voiceInputButton.isHidden = true
        }else {
            self.voiceButton.isSelected = true
            self.inputTextField.isHidden = true
            self.voiceInputButton.isHidden = false
        }
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
    
    @IBAction func chooseContract() {
        
    }
    
    @IBAction func chooseCard() {
        let Main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let contact = Main.instantiateViewController(withIdentifier: "XWContactListTableViewController") as! XWContactListTableViewController
        contact.blockproerty={ (user) in
            DispatchQueue.main.async {
                contact.dismiss(animated: true, completion: nil)
            }
        }
        let navi = UIBaseNavigationViewController(rootViewController: contact)
        self.navigationController?.present(navi, animated: true, completion: {
            
        })
    }

    func didSendCard(cardURL: String) {
        let message = MessageViewModel.init(owner: .receiver,type: .card,name:(self.currentUser?.name)!,content: "" ,  timestamp: Int(Date().timeIntervalSince1970),headImageURL: self.currentUser?.avatar, imageURL: cardURL)
        self.items.append(message)
        self.tableView.insertRows(at: [IndexPath.init(row: self.items.count - 1, section: 0)], with: UITableViewRowAnimation.bottom)
        if self.items.count > 0 {
            self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    @IBAction func chooseImage() {
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) {
            
        }
        imageData = UIImageJPEGRepresentation(info[UIImagePickerControllerOriginalImage] as! UIImage, 0.4)
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
                    self.didSendPhoto(imageURL: url!)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    func didSendPhoto(imageURL: String) {
        let message = MessageViewModel.init(owner: .receiver,type: .photo,name:(self.currentUser?.name)!,content: "" ,  timestamp: Int(Date().timeIntervalSince1970),headImageURL: self.currentUser?.avatar, imageURL: imageURL)
        self.items.append(message)
        self.tableView.insertRows(at: [IndexPath.init(row: self.items.count - 1, section: 0)], with: UITableViewRowAnimation.bottom)
        if self.items.count > 0 {
            self.tableView.scrollToRow(at: IndexPath.init(row: self.items.count - 1, section: 0), at: .bottom, animated: true)
        }
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

// MARK: - Record handlers
extension XWMessageViewController: AVAudioRecorderDelegate {
    
    /// 开始录音
    @objc private func beginRecordVoice() {
        if recorder == nil {
            return
        }
        view.addSubview(chatHUD)
        view.isUserInteractionEnabled = false  //录音时候禁止点击其他地方
        chatHUD.startCounting()
        soundMeters = [Float]()
        recorder.record()
        timer = Timer.scheduledTimer(timeInterval: updateFequency, target: self, selector: #selector(updateMeters), userInfo: nil, repeats: true)
    }
    
    /// 停止录音
    @objc private func endRecordVoice() {
        recorder.stop()
        timer?.invalidate()
        chatHUD.removeFromSuperview()
        view.isUserInteractionEnabled = true  //录音完了才能点击其他地方
        chatHUD.stopCounting()
        soundMeters.removeAll()
    }
    
    /// 取消录音
    @objc private func cancelRecordVoice() {
        endRecordVoice()
        recorder.deleteRecording()
    }
    
    /// 上划取消录音
    @objc private func remindDragExit() {
        chatHUD.titleLabel.text = "Release to cancel"
    }
    
    /// 下滑继续录音
    @objc private func remindDragEnter() {
        chatHUD.titleLabel.text = "Slide up to cancel"
    }
    
    @objc private func updateMeters() {
        recorder.updateMeters()
        recordTime += updateFequency
        addSoundMeter(item: recorder.averagePower(forChannel: 0))
        if recordTime >= 60.0 {
            endRecordVoice()
        }
    }
    
    private func addSoundMeter(item: Float) {
        if soundMeters.count < soundMeterCount {
            soundMeters.append(item)
        } else {
            for (index, _) in soundMeters.enumerated() {
                if index < soundMeterCount - 1 {
                    soundMeters[index] = soundMeters[index + 1]
                }
            }
            // 插入新数据
            soundMeters[soundMeterCount - 1] = item
            NotificationCenter.default.post(name: NSNotification.Name.init("updateMeters"), object: soundMeters)
        }
    }
    
    func addExtraData() {
//        let extra = XWMessageExtraModel(logo: targetUser?.avatar!, content: "", name: targetUser?.name, action: "", tokenAmount: 0, tokenId: 0, title: targetUser?.name)
        
    }
}

//MARK: - AVAudioRecorderDelegate
extension XWMessageViewController {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if recordTime > 1.0 {
            if flag {
                do {
                    let exists = try recorder.url.checkResourceIsReachable()
                    if exists {
                        print("finish record")
                    }
                }
                catch { print("fail to load record")}
            } else {
                print("record failed")
            }
        }
        recordTime = 0
    }
}

// MARK: - Setup
extension XWMessageViewController {
    
    private func setupButtonEvent() {
        voiceInputButton.addTarget(self, action: #selector(beginRecordVoice), for: .touchDown)
        voiceInputButton.addTarget(self, action: #selector(endRecordVoice), for: .touchUpInside)
        voiceInputButton.addTarget(self, action: #selector(cancelRecordVoice), for: .touchUpOutside)
        voiceInputButton.addTarget(self, action: #selector(cancelRecordVoice), for: .touchCancel)
        voiceInputButton.addTarget(self, action: #selector(remindDragExit), for: .touchDragExit)
        voiceInputButton.addTarget(self, action: #selector(remindDragEnter), for: .touchDragEnter)
    }
    
    private func configAVAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do { try session.setCategory(AVAudioSessionCategoryRecord, with: .defaultToSpeaker) }
        catch { print("session config failed") }
    }
    
    private func configRecord() {
        AVAudioSession.sharedInstance().requestRecordPermission { (allowed) in
            if !allowed {
                return
            }
        }
        let session = AVAudioSession.sharedInstance()
        do { try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker) }
        catch { print("session config failed") }
        do {
            self.recorder = try AVAudioRecorder(url: self.directoryURL()!, settings: self.recorderSetting)
            self.recorder.delegate = self
            self.recorder.prepareToRecord()
            self.recorder.isMeteringEnabled = true
        } catch {
            print(error.localizedDescription)
        }
        do { try AVAudioSession.sharedInstance().setActive(true) }
        catch { print("session active failed") }
    }
    
    private func directoryURL() -> URL? {
        //定义并构建一个url来保存音频，音频文件名为recording-yyyy-MM-dd-HH-mm-ss.m4a
        //根据时间来设置存储文件名
        let format = DateFormatter()
        format.dateFormat="yyyy-MM-dd-HH-mm-ss"
        let currentFileName = "recording-\(format.string(from: Date())).m4a"
        print(currentFileName)
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let soundFileURL = documentsDirectory.appendingPathComponent(currentFileName)
        return soundFileURL
    }
}
