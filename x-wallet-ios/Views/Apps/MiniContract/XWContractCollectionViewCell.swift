//
//  XWContractCollectionViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/16.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import QuartzCore

class XWContractCollectionViewCell: HFCardCollectionViewCell {
    
    var cardCollectionViewLayout: HFCardCollectionViewLayout?
    @IBOutlet weak var dataView: UIView!

    
    
    var needClear = false {
        didSet {
            if needClear {
                self.dataView.isHidden = true
            } else {
                self.dataView.isHidden = false
            }
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
