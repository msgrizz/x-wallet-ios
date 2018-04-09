//
//  XWContract.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/29.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

enum ContractType {
    case Currency
    case Receipt
    case Promise
    case IOU
}

class XWContract: NSObject {
    var title: String
    var type: ContractType
    var content: String
    var id: Int64?
    var remoteData: SMiniContract?
    
    //MARK: Inits
    init(title: String, type: ContractType, content: String , id: Int64 = 1) {
        self.title = title
        self.type = type
        self.content = content
        self.id = id
    }
}
