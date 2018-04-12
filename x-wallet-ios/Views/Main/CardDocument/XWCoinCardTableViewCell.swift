//
//  XWCoinCardTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/12.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWCoinCardTableViewCell: UITableViewCell {
    @IBOutlet weak var headImage: UIButton!
    @IBOutlet weak var showView: XWCoinCardView!
    @IBOutlet weak var topiew: XWCardHeadView!
    @IBOutlet weak var secondView: XWCardHeadView!
    

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
                topiew.backgroundImage.backgroundColor = UIColor.init(hex: colorHex)
                topiew.titleLabel.text = show1.coinName
            }
            if datas.dataModels.count>=3{
                let show2 = datas.dataModels[2]
                //                secondView.backgroundImage.image = show2.backgroundImage
                secondView.backgroundImage.backgroundColor = UIColor.init(hex: colorHex)
                secondView.titleLabel.text = show2.coinName
            }
            self.headImage.kf.setImage(with: URL(string: datas.appImage), for: UIControlState.normal)
            let show = datas.dataModels.first
            self.showView.titleLabel.text = show?.coinName
            self.showView.nameLabel.text = (show?.issuerName)!
            self.showView.userHead.kf.setImage(with: URL(string: (show?.issuerAvatar)!), for: UIControlState.normal)
            self.showView.detailLabel.text = "Possession/Limited：500/3000"
            self.showView.backgroundImage.backgroundColor = UIColor.init(hex: colorHex)
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
        showView.layer.shadowOffset = shadowOffset
        showView.layer.masksToBounds = false
        
        topiew.backgroundImage.layer.cornerRadius = 13
        topiew.backgroundImage.clipsToBounds = true
        topiew.backgroundImage.layer.masksToBounds = true
        topiew.layer.shadowOpacity = shadowOpacity
        topiew.layer.shadowColor = shadowColor
        topiew.layer.shadowRadius = shadowRadius
        topiew.layer.shadowOffset = shadowOffset
        topiew.layer.masksToBounds = false
        
        secondView.backgroundImage.layer.cornerRadius = 13
        secondView.backgroundImage.clipsToBounds = true
        secondView.backgroundImage.layer.masksToBounds = true
        secondView.layer.shadowOpacity = shadowOpacity
        secondView.layer.shadowColor = shadowColor
        secondView.layer.shadowRadius = shadowRadius
        secondView.layer.shadowOffset = shadowOffset
        
        secondView.layer.masksToBounds = false
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
