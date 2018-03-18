//
//  BaseCardModel.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/15.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

struct BaseCardModel {
    var title = "Employment Contract"
    var stared: Bool = true
    var newMessage: Bool = true
    var backgroundImage: UIImage {
        return UIImage(named: "cardBack")!
    }
    var isClear: Bool = false
}
