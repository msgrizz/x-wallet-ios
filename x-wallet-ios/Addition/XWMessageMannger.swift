//
//  XWMessageMannger.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/23.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import SugarRecord
import SwiftyUserDefaults
class XWMessageMannger: NSObject {
    
    private static var _instance = XWMessageMannger()
    class func sharedInstance() -> XWMessageMannger {
        return _instance
    }
    
    let delayTime = 2
    var messageTimer: DispatchSourceTimer?
    var conversationTimer: DispatchSourceTimer?
    
    var lastCid: Int64?
    
    lazy var db: CoreDataDefaultStorage = {
        let store = CoreDataStore.named(dataName)
        let bundle = Bundle(for: self.classForCoder)
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    }()
    
    func initPullingMessage() {
        messageTimer = DispatchSource.makeTimerSource(queue:DispatchQueue.init(label: "messageQueue"))
        messageTimer?.schedule(deadline: DispatchTime.now(), repeating: .seconds(delayTime), leeway: DispatchTimeInterval.milliseconds(10))
        messageTimer?.setEventHandler(handler: {
//            SChatControllerAPI.pullUsingGET(conversationId: 1, lastMsgId: 0, completion: { (messageArray, error) in
//                debugPrint("pulling")
//                guard messageArray != nil else {
//                    return
//                }
//                guard (messageArray?.count)!>0 else {
//                    return
//                }
//                
//                for messgae in messageArray! {
//                    debugPrint(messgae)
//                }
//            })
            
        })
        messageTimer?.resume()
    }

    func suspendPullingMessage() {
        self.messageTimer?.suspend()
    }
    
    func stopPullingMessage() {
        self.messageTimer?.cancel()
        self.messageTimer = nil
    }
    
    func startPullingMessage() {
        if self.messageTimer != nil {
            self.messageTimer?.resume()
        }else {
            self.initPullingMessage()
        }
    }
    
    func initPullingConversation() {
        conversationTimer = DispatchSource.makeTimerSource(queue:DispatchQueue.init(label: "conversationQueue"))
        conversationTimer?.schedule(deadline: DispatchTime.now(), repeating: .seconds(delayTime), leeway: DispatchTimeInterval.milliseconds(10))
        conversationTimer?.setEventHandler(handler: {
            SConversation2ControllerAPI.mySConversation2UsingGET1(accountId: Int64(Defaults[.userId]), lastCId: self.lastCid!, completion: { (conversations, error) in
                do {
                    try self.db.operation { (context, save) throws in
                        for ele in conversations! {
                            let localModel = try! self.db.fetch(FetchRequest<ConversationEntity>().filtered(with: "id", equalTo: "\(ele.id!)")).first
                            guard localModel == nil else {
                                continue
                            }
                            let con: ConversationEntity = try! context.create()
                            XWConvertManager.sharedInstance().convertConversation(conversation: ele, entity: con)
                            con.lastMessage = ele.lastMsg?.content
                            if ele.id! > self.lastCid! {
                                self.lastCid = ele.id
                            }
                            save()
                        }
                    }
                } catch {
                    // There was an error in the operation
                }
            })
        })
        conversationTimer?.resume()
    }
    
    func suspendPullingConversation() {
        self.conversationTimer?.suspend()
    }
    
    func stopPullingConversation() {
        self.conversationTimer?.cancel()
        self.conversationTimer = nil
    }
    
    func startPullingConversation() {
        self.stopPullingMessage()
        self.lastCid = try! db.fetch(FetchRequest<ConversationEntity>().sorted(with: "id", ascending: false)).first?.id ?? 0
        
        if self.conversationTimer != nil {
            if  (self.conversationTimer?.isCancelled)! {
                self.initPullingConversation()
            }else {
                self.conversationTimer?.resume()
            }
        }else {
            self.initPullingConversation()
        }
    }
}
