//
//  XWLocalManager.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/4.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWLocalManager: NSObject {
    
    open var localUser :ResourceSAccount!
    
    private static var _instance = XWLocalManager()
    class func sharedInstance() -> XWLocalManager {
        return _instance
    }
}
