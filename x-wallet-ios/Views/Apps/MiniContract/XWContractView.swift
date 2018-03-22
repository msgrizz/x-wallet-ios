//
//  XWContractView.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/15.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWContractView: UIView {
    let insert = 23
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var contractButton: UIButton!

    var cards: [BaseCardModel] = [BaseCardModel]() {
        didSet {
            for (i, item) in cards.enumerated() {
                let cardView = XWBaseCardView.fromNib()
                cardView.card = item
                cardView.frame = getCardRect(index: i)
                self.contentView.addSubview(cardView)
            }
            backImageView.layer.borderColor = UIColor.clear.cgColor
            backImageView.layer.cornerRadius = 13
            backImageView.clipsToBounds = true
        }
    }
    
    func getCardRect(index: Int) -> CGRect {
        switch index {
        case 0:
            return CGRect(x: 7, y: 7, width: self.contentView.frame.size.width - 14, height: 82)
        case 1:
            return CGRect(x: 7, y: Int(7 + insert * 2), width: Int(self.contentView.frame.size.width - 14), height: 82)
        case 2:
            return CGRect(x: 7, y: Int(7 + insert * 4), width: Int(self.contentView.frame.size.width - 14), height: 82)
        default:
            return CGRect(x: 7, y: 7, width: self.contentView.frame.size.width - 14, height: 70)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    class func fromNib() -> XWContractView {
        return Bundle.main.loadNibNamed(String(describing: XWContractView.self), owner: nil, options: nil)![0] as! XWContractView
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
