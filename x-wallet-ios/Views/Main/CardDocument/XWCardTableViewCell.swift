//
//  XWCardTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/11.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWCardTableViewCell: UITableViewCell {
    @IBOutlet weak var headImage: UIButton!
    @IBOutlet weak var topView: XWCardBaseView!
    @IBOutlet weak var secondView: XWCardHeadView!
    @IBOutlet weak var thirdView: XWCardHeadView!

    var datas: XWAppModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
