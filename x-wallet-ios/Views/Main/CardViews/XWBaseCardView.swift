//
//  XWBaseCardView.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/15.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWBaseCardView: UIView {
    var card: BaseCardModel = BaseCardModel() {
        didSet {
            backImage.image = card.backgroundImage
            titleLabel.text = card.title
            tagButton.isHidden = !card.stared
            newMessageButton.isHidden = !card.newMessage
        }
    }
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newMessageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func fromNib() -> XWBaseCardView {
        return Bundle.main.loadNibNamed(String(describing: XWBaseCardView.self), owner: nil, options: nil)![0] as! XWBaseCardView
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
