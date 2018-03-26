//
//  XWUser.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/26.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWUser: NSObject {
    var name: String
    var email: String
    var id: String
    var profilePic: UIImage
    //MARK: Inits
    init(name: String, email: String, id: String, profilePic: UIImage) {
        self.name = name
        self.email = email
        self.id = id
        self.profilePic = profilePic
    }
}
