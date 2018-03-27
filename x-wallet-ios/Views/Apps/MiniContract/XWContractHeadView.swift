//
//  XWContractHeadView.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/27.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWContractHeadView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!

    func clearData() {
        titleLabel.text = ""
        starButton.isHidden = true
        checkButton.isHidden = true
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    class func fromNib() -> XWContractHeadView {
        return Bundle.main.loadNibNamed(String(describing: XWContractHeadView.self), owner: nil, options: nil)![0] as! XWContractHeadView
    }

}
