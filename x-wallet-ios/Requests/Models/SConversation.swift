//
// SConversation.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SConversation: Codable {

    public var activated: Bool?
    public var createTime: Int64?
    public var creator: SAccount?
    public var id: Int64?
    public var lastModifyTime: Int64?
    public var name: String?
    public var version: Int64?


    
    public init(activated: Bool?, createTime: Int64?, creator: SAccount?, id: Int64?, lastModifyTime: Int64?, name: String?, version: Int64?) {
        self.activated = activated
        self.createTime = createTime
        self.creator = creator
        self.id = id
        self.lastModifyTime = lastModifyTime
        self.name = name
        self.version = version
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(activated, forKey: "activated")
        try container.encodeIfPresent(createTime, forKey: "createTime")
        try container.encodeIfPresent(creator, forKey: "creator")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(lastModifyTime, forKey: "lastModifyTime")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(version, forKey: "version")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        activated = try container.decodeIfPresent(Bool.self, forKey: "activated")
        createTime = try container.decodeIfPresent(Int64.self, forKey: "createTime")
        creator = try container.decodeIfPresent(SAccount.self, forKey: "creator")
        id = try container.decodeIfPresent(Int64.self, forKey: "id")
        lastModifyTime = try container.decodeIfPresent(Int64.self, forKey: "lastModifyTime")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        version = try container.decodeIfPresent(Int64.self, forKey: "version")
    }
}

