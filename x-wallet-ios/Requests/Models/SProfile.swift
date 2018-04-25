//
// SProfile.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SProfile: Codable {

    public var account: SAccount?
    public var activated: Bool?
    public var avatar: String?
    public var createTime: Int64?
    public var email: String?
    public var id: Int64?
    public var lastModifyTime: Int64?
    public var mobile: String?
    public var name: String?
    public var tag: String?
    public var version: Int64?


    
    public init(account: SAccount?, activated: Bool?, avatar: String?, createTime: Int64?, email: String?, id: Int64?, lastModifyTime: Int64?, mobile: String?, name: String?, tag: String?, version: Int64?) {
        self.account = account
        self.activated = activated
        self.avatar = avatar
        self.createTime = createTime
        self.email = email
        self.id = id
        self.lastModifyTime = lastModifyTime
        self.mobile = mobile
        self.name = name
        self.tag = tag
        self.version = version
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(account, forKey: "account")
        try container.encodeIfPresent(activated, forKey: "activated")
        try container.encodeIfPresent(avatar, forKey: "avatar")
        try container.encodeIfPresent(createTime, forKey: "createTime")
        try container.encodeIfPresent(email, forKey: "email")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(lastModifyTime, forKey: "lastModifyTime")
        try container.encodeIfPresent(mobile, forKey: "mobile")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(tag, forKey: "tag")
        try container.encodeIfPresent(version, forKey: "version")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        account = try container.decodeIfPresent(SAccount.self, forKey: "account")
        activated = try container.decodeIfPresent(Bool.self, forKey: "activated")
        avatar = try container.decodeIfPresent(String.self, forKey: "avatar")
        createTime = try container.decodeIfPresent(Int64.self, forKey: "createTime")
        email = try container.decodeIfPresent(String.self, forKey: "email")
        id = try container.decodeIfPresent(Int64.self, forKey: "id")
        lastModifyTime = try container.decodeIfPresent(Int64.self, forKey: "lastModifyTime")
        mobile = try container.decodeIfPresent(String.self, forKey: "mobile")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        tag = try container.decodeIfPresent(String.self, forKey: "tag")
        version = try container.decodeIfPresent(Int64.self, forKey: "version")
    }
}

