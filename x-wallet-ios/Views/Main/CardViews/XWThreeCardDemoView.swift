//
//  XWThreeCardDemoView.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWThreeCardDemoView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func fromNib() -> XWThreeCardDemoView {
        return Bundle.main.loadNibNamed(String(describing: XWThreeCardDemoView.self), owner: nil, options: nil)![0] as! XWThreeCardDemoView
    }


}