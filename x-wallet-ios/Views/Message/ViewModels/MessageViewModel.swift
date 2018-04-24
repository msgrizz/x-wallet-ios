//
//  MessageViewModel.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import Foundation
import UIKit

enum MessageType {
    case photo
    case text
    case card
    case voice
    case location
}

enum MessageOwner {
    case sender
    case receiver
}

struct MessageViewModel {
    var owner: MessageOwner
    var type: MessageType
    var name = "123"
    var content = "234"
    var timestamp: Int?
    var headImageURL: String?
    var imageURL :String?
}
