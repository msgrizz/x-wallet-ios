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
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var showView: XWCardBaseView!
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
                topiew.titleLabel.text = show1.title
            }
            if datas.dataModels.count>=3{
                let show2 = datas.dataModels[2]
//                secondView.backgroundImage.image = show2.backgroundImage
                secondView.backgroundImage.backgroundColor = UIColor.init(hex: colorHex)
                secondView.titleLabel.text = show2.title
            }
            self.headImage.kf.setImage(with: URL(string: datas.appImage), for: UIControlState.normal)
            self.logoLabel.text = (datas.type)!.rawValue
            let show = datas.dataModels.first
            
            switch datas.type {
            case .miniContract?:
                self.showView.titleLabel.text = show?.title
                self.showView.contentLabel.text = show?.content
                self.showView.detailLabel.text = ""
                break
            case .miniCoin?:

                break
            case .coupon?:
                self.showView.titleLabel.text = show?.title
                self.showView.contentLabel.text = "No：\((show?.id)!)"
                let date = Date(timeIntervalSince1970: Double((show?.expiredAt)!)/1000)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy" //Specify your format that you want
                self.showView.detailLabel.text = "Expires：\(dateFormatter.string(from: date))"
                break
            default :
                self.showView.titleLabel.text = show?.title
                self.showView.contentLabel.text = show?.line1
                self.showView.detailLabel.text = show?.line2
                break
            }
            if datas.type == .music{
                self.showView.backgroundImage.backgroundColor = UIColor.init(hex: colorMusicHex)
                self.topiew.backgroundImage.backgroundColor = UIColor.init(hex: colorMusicHex)
                self.secondView.backgroundImage.backgroundColor = UIColor.init(hex: colorMusicHex)

            }else {
                self.showView.backgroundImage.backgroundColor = UIColor.init(hex: colorHex)
                self.topiew.backgroundImage.backgroundColor = UIColor.init(hex: colorHex)
                self.secondView.backgroundImage.backgroundColor = UIColor.init(hex: colorHex)
            }
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
