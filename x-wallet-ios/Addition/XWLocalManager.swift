//
//  XWLocalManager.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/4.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import CoreData
import SugarRecord
import SwiftyUserDefaults
class XWLocalManager: NSObject {
    
    lazy var db: CoreDataDefaultStorage = {
        let store = CoreDataStore.named(dataName)
        let bundle = Bundle(for: self.classForCoder)
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    }()
    
    open var localUser :SAccount!
    
    open var rcUserId: String?
    
    private static var _instance = XWLocalManager()
    class func sharedInstance() -> XWLocalManager {
        return _instance
    }
    
    func getMySelf() -> UserEntity{
        let predicate: NSPredicate = NSPredicate(format: "id == %@", String(Defaults[.userId]))
        let me: UserEntity? = try! self.db.fetch(FetchRequest<UserEntity>().filtered(with: predicate)).first
        return me!
    }
}
