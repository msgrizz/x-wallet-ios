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

class XWMessageMannger: NSObject {
    let delayTime = 2
    var messageTimer: DispatchSourceTimer = DispatchSource.makeTimerSource(queue:DispatchQueue.init(label: "messageQueue"))
    lazy var db: CoreDataDefaultStorage = {
        let store = CoreDataStore.named(dataName)
        let bundle = Bundle(for: self.classForCoder)
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    }()
    
    func startPulling() {
        messageTimer.schedule(deadline: DispatchTime.now(), repeating: .seconds(delayTime), leeway: DispatchTimeInterval.milliseconds(10))
        messageTimer.setEventHandler(handler: {
            SChatControllerAPI.pullUsingGET(conversationId: 1, lastMsgId: 0, completion: { (messageArray, error) in
                guard messageArray != nil else {
                    return
                }
                guard (messageArray?.count)!>0 else {
                    return
                }
                
                for messgae in messageArray! {
                    debugPrint(messgae)
                }
            })
        })
        messageTimer.resume()
    }
//
//    func stopPulling() {
//        self.messageTimer.resume()()
//    }
}
