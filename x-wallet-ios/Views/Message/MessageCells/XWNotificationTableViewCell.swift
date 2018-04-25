
//
//  XWNotificationTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/25.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWNotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var recieverLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
