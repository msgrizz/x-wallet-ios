//
//  XWSlideView.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/14.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import DynamicBlurView
class XWSlideView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var miniContract: UILabel!
    @IBOutlet var coin: UILabel!
    @IBOutlet var receiveCode: UILabel!
    @IBOutlet var scan: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    class func fromNib() -> XWSlideView {
        return Bundle.main.loadNibNamed(String(describing: XWSlideView.self), owner: nil, options: nil)![0] as! XWSlideView
    }
}
