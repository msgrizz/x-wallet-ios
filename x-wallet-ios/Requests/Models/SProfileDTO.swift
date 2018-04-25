//
// SProfileDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SProfileDTO: Codable {

    public var account: Int64?
    public var name: String?
    public var avatar: String?
    public var mobile: String?
    public var email: String?
    public var tag: String?


    
    public init(account: Int64?, name: String?, avatar: String?, mobile: String?, email: String?, tag: String?) {
        self.account = account
        self.name = name
        self.avatar = avatar
        self.mobile = mobile
        self.email = email
        self.tag = tag
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(account, forKey: "account")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(avatar, forKey: "avatar")
        try container.encodeIfPresent(mobile, forKey: "mobile")
        try container.encodeIfPresent(email, forKey: "email")
        try container.encodeIfPresent(tag, forKey: "tag")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        account = try container.decodeIfPresent(Int64.self, forKey: "account")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        avatar = try container.decodeIfPresent(String.self, forKey: "avatar")
        mobile = try container.decodeIfPresent(String.self, forKey: "mobile")
        email = try container.decodeIfPresent(String.self, forKey: "email")
        tag = try container.decodeIfPresent(String.self, forKey: "tag")
    }
}

