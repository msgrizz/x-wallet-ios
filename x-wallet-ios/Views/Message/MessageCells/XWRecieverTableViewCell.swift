//
//  XWRecieverTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/23.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWRecieverTableViewCell: UITableViewCell {

    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var messageBackground: UIImageView!
    @IBOutlet weak var profilePic: RoundedImageView!
    @IBOutlet weak var nameLabel: UILabel!

    func clearCellData()  {
        self.message.text = nil
        self.message.isHidden = false
        self.messageBackground.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.message.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5)
        self.messageBackground.layer.cornerRadius = 15
        self.messageBackground.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
