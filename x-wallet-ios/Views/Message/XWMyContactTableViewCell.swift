//
//  XWMyContactTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/22.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWMyContactTableViewCell: UITableViewCell {
    @IBOutlet weak var headView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headView.layer.borderWidth = 1
        headView.layer.masksToBounds = false
        headView.layer.borderColor = UIColor.white.cgColor
        headView.layer.cornerRadius = headView.frame.height/2
        headView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
