//
//  XWCardListHeaderView.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/22.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWCardListHeaderView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberButton: UIButton!
    
    func clearData() {
        titleLabel.text = ""
        numberButton.isHidden = true
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func fromNib() -> XWCardListHeaderView {
        return Bundle.main.loadNibNamed(String(describing: XWCardListHeaderView.self), owner: nil, options: nil)![0] as! XWCardListHeaderView
    }
}
