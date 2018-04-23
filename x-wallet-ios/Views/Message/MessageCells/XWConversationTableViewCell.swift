//
//  XWConversationTableViewCell.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/13.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import Kingfisher
class XWConversationTableViewCell: UITableViewCell {
    @IBOutlet weak var headImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    var dataModel: XWConversationViewModel!{
        didSet {
            headImage.kf.setImage(with: URL(string: dataModel.headURL), for: .normal)
            nameLabel.text = dataModel.name
            contentLabel.text = dataModel.content
            
            let timeInterval = Double(dataModel.time!)/1000
            let date = Date(timeIntervalSince1970: timeInterval)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd hh:mm" //Specify your format that you want
            timeLabel.text = dateFormatter.string(from: date)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headImage.layer.borderWidth = 3
        headImage.layer.masksToBounds = false
        headImage.layer.borderColor = UIColor.white.cgColor
        headImage.layer.cornerRadius = headImage.frame.height/2
        headImage.clipsToBounds = true
        
        
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
