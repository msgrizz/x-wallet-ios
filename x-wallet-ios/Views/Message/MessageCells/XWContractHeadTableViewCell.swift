//
//  XWContractHeadTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWContractHeadTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var contentLabel : UILabel!
    @IBOutlet weak var sender : UIButton!
    @IBOutlet weak var reciever : UIButton!
    @IBOutlet weak var senderCheck : UIImageView!
    @IBOutlet weak var recieverCheck : UIImageView!
    @IBOutlet weak var signButton : UIButton!
    @IBOutlet weak var timeLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sender.layer.masksToBounds = false
        sender.layer.cornerRadius = sender.frame.height/2
        sender.clipsToBounds = true
        
        reciever.layer.masksToBounds = false
        reciever.layer.cornerRadius = reciever.frame.height/2
        reciever.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func clearCellData() {
        self.titleLabel.text = ""
        self.contentLabel.text = ""
        self.senderCheck.isHidden = true
        self.recieverCheck.isHidden = true
        self.signButton.isHidden = true
        self.timeLabel.text = ""
//        self.signButton.titleLabel?.text = ""
    }


}
