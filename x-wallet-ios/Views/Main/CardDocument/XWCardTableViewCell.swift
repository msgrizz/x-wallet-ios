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
    @IBOutlet weak var showView: XWCardBaseView!
    @IBOutlet weak var topiew: XWCardHeadView!
    @IBOutlet weak var secondView: XWCardHeadView!
    
    let shadowOpacity:Float = 1
    let shadowColor = UIColor.black.cgColor
    let shadowRadius:CGFloat = 4
    var datas: XWAppModel! {
        didSet {
            if datas.dataModels.count == 1 {
                self.topiew.isHidden = true
                self.secondView.isHidden = true
            }else if datas.dataModels.count == 2{
                self.topiew.isHidden = false
                self.secondView.isHidden = true
            }else {
                self.topiew.isHidden = false
                self.secondView.isHidden = false
            }
            if datas.dataModels.count>=2 {
                let show1 = datas.dataModels[1]
//                topiew.backgroundImage.image = show1.backgroundImage
                topiew.backgroundImage.backgroundColor = UIColor.init(hex: "425061")
                topiew.titleLabel.text = show1.title
            }
            if datas.dataModels.count>=3{
                let show2 = datas.dataModels[2]
//                secondView.backgroundImage.image = show2.backgroundImage
                secondView.backgroundImage.backgroundColor = UIColor.init(hex: "425061")
                secondView.titleLabel.text = show2.title
            }
            self.headImage.kf.setImage(with: URL(string: datas.appImage), for: UIControlState.normal)
            let show = datas.dataModels.first
            self.showView.titleLabel.text = show?.title
            self.showView.contentLabel.text = show?.content
            self.showView.detailLabel.text = show?.detail
            self.showView.backgroundImage.backgroundColor = UIColor.init(hex: "425061")
//            self.showView.backgroundImage.image = show?.backgroundImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        showView.backgroundImage.layer.cornerRadius = 13
        showView.backgroundImage.clipsToBounds = true
        showView.backgroundImage.layer.masksToBounds = true
        showView.layer.shadowOpacity = shadowOpacity
        showView.layer.shadowColor = shadowColor
        showView.layer.shadowRadius = shadowRadius
        showView.layer.shadowOffset = CGSize(width: 1, height: 1)
        showView.layer.masksToBounds = false

        topiew.backgroundImage.layer.cornerRadius = 13
        topiew.backgroundImage.clipsToBounds = true
        topiew.backgroundImage.layer.masksToBounds = true
        topiew.layer.shadowOpacity = shadowOpacity
        topiew.layer.shadowColor = shadowColor
        topiew.layer.shadowRadius = shadowRadius
        topiew.layer.shadowOffset = CGSize(width: 1, height: 1)
        topiew.layer.masksToBounds = false
        
        secondView.backgroundImage.layer.cornerRadius = 13
        secondView.backgroundImage.clipsToBounds = true
        secondView.backgroundImage.layer.masksToBounds = true
        secondView.layer.shadowOpacity = shadowOpacity
        secondView.layer.shadowColor = shadowColor
        secondView.layer.shadowRadius = shadowRadius
        secondView.layer.shadowOffset = CGSize(width: 1, height: 1)

        secondView.layer.masksToBounds = false
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
