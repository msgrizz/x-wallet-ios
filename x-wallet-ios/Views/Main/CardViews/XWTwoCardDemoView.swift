//
//  XWTwoCardDemoView.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWTwoCardDemoView: UIView {
    @IBOutlet weak var backImageView: UIImageView!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func fromNib() -> XWTwoCardDemoView {
        return Bundle.main.loadNibNamed(String(describing: XWTwoCardDemoView.self), owner: nil, options: nil)![0] as! XWTwoCardDemoView
    }

}
