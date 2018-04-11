//
//  XWMyBagTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/11.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWMyBagTableViewCell: UITableViewCell {
    @IBOutlet weak var myBagView:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myBagView.layer.cornerRadius = 13
        myBagView.clipsToBounds = true
        myBagView.layer.shadowOpacity = 0.8
        myBagView.layer.shadowColor = UIColor.black.cgColor
        myBagView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
