//
//  XWMessageExtraModel.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/28.
//  Copyright © 2018年 evrins. All rights reserved.
//

import Foundation
import UIKit

class XWMessageExtraModel: Codable {
    public var logo: String?
    public var content: String?
    public var name: String?
    public var action: String?
    public var tokenAmount: Int64?
    public var tokenId: Int64?
    public var title: String?

    public init(logo: String?, content: String?, name: String?, action: String?, tokenAmount: Int64?, tokenId: Int64?, title: String?) {
        self.logo = logo
        self.content = content
        self.name = name
        self.action = action
        self.tokenAmount = tokenAmount
        self.tokenId = tokenId
        self.title = title
    }
    
    
    // Encodable protocol methods
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: String.self)
        
        try container.encodeIfPresent(logo, forKey: "logo")
        try container.encodeIfPresent(content, forKey: "content")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(action, forKey: "action")
        try container.encodeIfPresent(tokenAmount, forKey: "tokenAmount")
        try container.encodeIfPresent(tokenId, forKey: "tokenId")
        try container.encodeIfPresent(title, forKey: "title")
    }
    
    // Decodable protocol methods
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)
        
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
        content = try container.decodeIfPresent(String.self, forKey: "content")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        action = try container.decodeIfPresent(String.self, forKey: "action")
        tokenAmount = try container.decodeIfPresent(Int64.self, forKey: "tokenAmount")
        tokenId = try container.decodeIfPresent(Int64.self, forKey: "tokenId")
        title = try container.decodeIfPresent(String.self, forKey: "title")
    }
}
