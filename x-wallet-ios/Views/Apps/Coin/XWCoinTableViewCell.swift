//
//  XWCoinTableViewCell.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/27.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWCoinTableViewCell: UITableViewCell {
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newMessageButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    var coinData: CoinsModel {
        didSet {
            titleLabel.text = coinData.title
            contentLabel.text = coinData.content
            tagButton.isHidden = !coinData.stared
            transferButton.isHidden = !coinData.canTansfer
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.coinData = CoinsModel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.coinData = CoinsModel()
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
