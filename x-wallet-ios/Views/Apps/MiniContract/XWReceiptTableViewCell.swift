//
//  XWReceiptTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/12.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWReceiptTableViewCell: UITableViewCell {
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var newMessageButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
