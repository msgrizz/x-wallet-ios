//
// SNotification.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SNotification: Codable {

    public var action: String?
    public var activated: Bool?
    public var createTime: Int64?
    public var data: String?
    public var id: Int64?
    public var lastModifyTime: Int64?
    public var receiver: SAccount?
    public var sender: SAccount?
    public var title: String?
    public var version: Int64?


    
    public init(action: String?, activated: Bool?, createTime: Int64?, data: String?, id: Int64?, lastModifyTime: Int64?, receiver: SAccount?, sender: SAccount?, title: String?, version: Int64?) {
        self.action = action
        self.activated = activated
        self.createTime = createTime
        self.data = data
        self.id = id
        self.lastModifyTime = lastModifyTime
        self.receiver = receiver
        self.sender = sender
        self.title = title
        self.version = version
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(action, forKey: "action")
        try container.encodeIfPresent(activated, forKey: "activated")
        try container.encodeIfPresent(createTime, forKey: "createTime")
        try container.encodeIfPresent(data, forKey: "data")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(lastModifyTime, forKey: "lastModifyTime")
        try container.encodeIfPresent(receiver, forKey: "receiver")
        try container.encodeIfPresent(sender, forKey: "sender")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(version, forKey: "version")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        action = try container.decodeIfPresent(String.self, forKey: "action")
        activated = try container.decodeIfPresent(Bool.self, forKey: "activated")
        createTime = try container.decodeIfPresent(Int64.self, forKey: "createTime")
        data = try container.decodeIfPresent(String.self, forKey: "data")
        id = try container.decodeIfPresent(Int64.self, forKey: "id")
        lastModifyTime = try container.decodeIfPresent(Int64.self, forKey: "lastModifyTime")
        receiver = try container.decodeIfPresent(SAccount.self, forKey: "receiver")
        sender = try container.decodeIfPresent(SAccount.self, forKey: "sender")
        title = try container.decodeIfPresent(String.self, forKey: "title")
        version = try container.decodeIfPresent(Int64.self, forKey: "version")
    }
}

