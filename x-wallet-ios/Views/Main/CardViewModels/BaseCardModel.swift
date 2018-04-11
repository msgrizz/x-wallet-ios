//
//  BaseCardModel.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/15.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

enum AppType {
    case MiniContract
    case Coin
    case Membership
    case Receipt
    case Ticket
    case Other
}


struct BaseCardModel {
    var title = "Employment Contract"
    var content = ""
    var detail = ""
    var stared: Bool = true
    var newMessage: Bool = true
    var backgroundImage: UIImage {
        return UIImage(named: "baseBackImage")!
    }
    var isClear: Bool = false
}
