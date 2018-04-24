//
//  Constant.swift
//  x-wallet-ios
//
//  Created by 胡波 on 2018/3/28.
//  Copyright © 2018年 linkio. All rights reserved.
//

import Foundation

#if DEBUG // 判断是否在测试环境下
//let kHostURL = "http://192.168.18.138:8081/#/"
let kHostURL = "https://udapfront.iclass.cn/#/"

#else
let kHostURL = "https://udapfront.iclass.cn/#/"
#endif



let kMyCardURL = kHostURL+"MyCard"
let kInviteFriendsURL = kHostURL+"InviteFriends"

let kTransferCoinsURL = kHostURL+"TransferCoins"

let kMarketURL = kHostURL+"apps"
let kPurchaseURL = kHostURL+"Purchase"
let kSuccessURL = kHostURL+"Success"
let kTogetURL = kHostURL+"Toget"

let kCreateContractURL = kHostURL+"CreateContract"
let kCreateIOUURL = kHostURL+"CreateIou"
let kCreatePromiseURL = kHostURL+"CreatePromise"
let kCreatReceiptURL = kHostURL+"CreatReceipt"

let kIOUURL = kHostURL+"iou"
let kMiniContractURL = kHostURL+"MiniContract"
let kPromiseURL = kHostURL+"Promise"
let kMembershipURL = kHostURL+"membership"
let kReceiptURL = kHostURL+"Receipt"
let kCouponURL = kHostURL+"coupon"
let kInvoiceURL = kHostURL+"invoice"
let kMusicURL = kHostURL+"music"

