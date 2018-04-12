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
let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
let shadowRadius:CGFloat = 3
let shadowOffset = CGSize(width: 0, height: -1)
let colorHex = "425061"

func applyStyle() {

    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().tintColor = AppStyle.navigationBarTintColor
    UINavigationBar.appearance().setBackgroundImage(.filled(with: Colors.darkBlue), for: .default)

    UINavigationBar.appearance().titleTextAttributes = [
        .foregroundColor: UIColor.white,
    ]

    UITextField.appearance().tintColor = Colors.blue

    UIImageView.appearance().tintColor = Colors.lightBlue
}

struct Colors {
    static let darkBlue = UIColor(hex: "3375BB")
    static let blue = UIColor(hex: "2e91db")
    static let red = UIColor(hex: "f7506c")
    static let veryLightRed = UIColor(hex: "FFF4F4")
    static let veryLightOrange = UIColor(hex: "FFECC9")
    static let green = UIColor(hex: "2fbb4f")
    static let lightGray = UIColor.lightGray
    static let veryLightGray = UIColor(hex: "F6F6F6")
    static let gray = UIColor.gray
    static let darkGray = UIColor(hex: "606060")
    static let black = UIColor(hex: "313849")
    static let lightBlack = UIColor(hex: "313849")
    static let lightBlue = UIColor(hex: "007aff")
    static let backGroundColor = UIColor(hex: "2F3843")
    static let tintColor = UIColor(hex: "F32D60")
}

struct AppStyle {
    static let navigationBarTintColor = UIColor.white
    static let docPickerNavigationBarTintColor = Colors.blue
}

struct StyleLayout {
    static let sideMargin: CGFloat = 15
}
