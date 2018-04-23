//
//  XWConvertManager.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/23.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWConvertManager: NSObject {
    private static var _instance = XWConvertManager()
    class func sharedInstance() -> XWConvertManager {
        return _instance
    }
    
    func convertUser(user: SAccount, entity: UserEntity){
        entity.loginName = user.loginName
        entity.nickname = user.nickname
        entity.about = user.about
        entity.avatar = user.avatar
        entity.credit = "\(user.credit ?? 0)"
        entity.email = user.email
        entity.mobile = user.mobile
        entity.id = user.id!
    }
    
    func convertConversation(conversation: SConversation, entity: ConversationEntity){
        entity.name = conversation.name
        entity.id = conversation.id!
        entity.lastModifyTime = conversation.lastModifyTime!
        entity.createTime = conversation.createTime!
        entity.creator = (conversation.creator?.id)!
    }
}
