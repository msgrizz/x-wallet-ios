//
//  XWNotifacationViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/25.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWNotifacationViewController: UIBaseViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var items = [NotificationModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return self.items.count
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
        let data = self.items[indexPath.row]
        if data.hasMore {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWNotificationMoreTableViewCell", for: indexPath) as! XWNotificationMoreTableViewCell
            cell.timeLable.text = data.time
            cell.titleLabel.text = data.title
            cell.dateLabel.text = data.date
            cell.contentLabel.text = data.content
            cell.numberLabel.text = data.count
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XWNotificationTableViewCell", for: indexPath) as! XWNotificationTableViewCell
            cell.timeLable.text = data.time
            cell.titleLabel.text = data.title
            cell.dateLabel.text = data.date
            cell.contentLabel.text = data.content
            cell.senderLabel.text = data.sender
            cell.recieverLabel.text = data.reciever
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
