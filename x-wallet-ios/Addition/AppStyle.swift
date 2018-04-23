//
//  FirstViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/6.
//  Copyright © 2018年 linkio. All rights reserved.
//

import Foundation
import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

let shadowOpacity:Float = 1
let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
let shadowRadius:CGFloat = 6
let shadowOffset = CGSize(width: 1, height: 1)
let colorHex = "425061"

let appScheme = "xwallet"
let dataName = "DataModel"

func applyStyle() {

    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().tintColor = AppStyle.navigationBarTintColor

    UINavigationBar.appearance().titleTextAttributes = [
        .foregroundColor: UIColor.white,
    ]
}

struct Colors {
    static let backGroundColor = UIColor(hex: "2F3843")
    static let tintColor = UIColor(hex: "F32D60")
}

struct AppStyle {
    static let navigationBarTintColor = UIColor.white
}

struct StyleLayout {
    static let sideMargin: CGFloat = 15
}
