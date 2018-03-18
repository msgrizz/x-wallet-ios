//
//  XWNoCardView.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/15.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWNoCardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func fromNib() -> XWNoCardView {
        return Bundle.main.loadNibNamed(String(describing: XWNoCardView.self), owner: nil, options: nil)![0] as! XWNoCardView
    }
}
