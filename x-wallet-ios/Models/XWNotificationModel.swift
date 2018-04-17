//
//  XWNotificationModel.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/17.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWNotificationModel: Codable {
    public var title: String?
    public var content: String?
    public var dataId: Int64?
    public var type: String?
    
    public init(title: String?, content: String?, dataId: Int64?, type: String?) {
        self.title = title
        self.content = content
        self.dataId = dataId
        self.type = type
    }
    
    
    // Encodable protocol methods
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: String.self)
        
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(content, forKey: "content")
        try container.encodeIfPresent(dataId, forKey: "dataId")
        try container.encodeIfPresent(type, forKey: "type")
    }
    
    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)
        
        title = try container.decodeIfPresent(String.self, forKey: "title")
        content = try container.decodeIfPresent(String.self, forKey: "content")
        dataId = try container.decodeIfPresent(Int64.self, forKey: "dataId")
        type = try container.decodeIfPresent(String.self, forKey: "type")
    }
}
