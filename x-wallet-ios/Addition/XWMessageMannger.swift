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
        if self.conversationTimer != nil {
            self.conversationTimer?.resume()
        }else {
            self.initPullingMessage()
        }
    }
}
