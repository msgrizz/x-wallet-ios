//
//  DefaultsKeys.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/13.
//  Copyright © 2018年 linkio. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let username = DefaultsKey<String?>("username")
    static let launchCount = DefaultsKey<Int>("launchCount")
    static let lastLaunchVersion = DefaultsKey<String>("lastLaunchVersion")
}
