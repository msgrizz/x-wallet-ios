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
    
    func convertMessage(message: SMessage2, entity: MessageEntity){
        entity.content = message.content
        entity.messageType = message.type?.rawValue
        entity.amount = message.amount!
        entity.tokenId = message.tokenId!
        entity.contractId = message.contractId!
        entity.conversationId = message.conversationId!
        entity.miniContractAction = message.miniContractAction?.rawValue
        entity.profileId = message.profileId!
        entity.tokenAction = message.tokenAction?.rawValue
        entity.id = message.id!
        entity.lastModifyTime = message.lastModifyTime!
        entity.createTime = message.createTime!
    }
    
    func convertConversation(conversation: SConversation2, entity: ConversationEntity){
        let user = XWLocalManager.sharedInstance().getMySelf()
        if user.id == conversation.creator?.id {
            entity.name = conversation.partner?.nickname
            entity.avatar = conversation.partner?.avatar
        }else {
            entity.name = conversation.creator?.nickname
            entity.avatar = conversation.creator?.avatar
        }
        entity.id = conversation.id!
        entity.conversationType = conversation.type?.rawValue
        entity.lastMessage = conversation.lastMsg?.content
        entity.lastModifyTime = conversation.lastModifyTime!
        entity.createTime = conversation.createTime!
        entity.creator = (conversation.creator?.id)!
        entity.partner = (conversation.partner?.id)!
    }
}
