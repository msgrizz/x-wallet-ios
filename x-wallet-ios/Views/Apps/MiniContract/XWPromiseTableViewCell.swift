//
//  XWPromiseTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/12.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWPromiseTableViewCell: UITableViewCell {
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var tagButton: UIButton!
    
    @IBOutlet weak var partAHead: UIButton!
    @IBOutlet weak var partBHead: UIButton!
    @IBOutlet weak var partAName: UILabel!
    @IBOutlet weak var partBName: UILabel!

    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
