//
// SAccount.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SAccount: Codable {

    public var about: String?
    public var activated: Bool?
    public var avatar: String?
    public var createTime: Int64?
    public var email: String?
    public var id: Int64?
    public var lastModifyTime: Int64?
    public var loginName: String?
    public var loginPass: String?
    public var mobile: String?
    public var nickname: String?
    public var paymentPass: String?
    public var version: Int64?


    
    public init(about: String?, activated: Bool?, avatar: String?, createTime: Int64?, email: String?, id: Int64?, lastModifyTime: Int64?, loginName: String?, loginPass: String?, mobile: String?, nickname: String?, paymentPass: String?, version: Int64?) {
        self.about = about
        self.activated = activated
        self.avatar = avatar
        self.createTime = createTime
        self.email = email
        self.id = id
        self.lastModifyTime = lastModifyTime
        self.loginName = loginName
        self.loginPass = loginPass
        self.mobile = mobile
        self.nickname = nickname
        self.paymentPass = paymentPass
        self.version = version
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(about, forKey: "about")
        try container.encodeIfPresent(activated, forKey: "activated")
        try container.encodeIfPresent(avatar, forKey: "avatar")
        try container.encodeIfPresent(createTime, forKey: "createTime")
        try container.encodeIfPresent(email, forKey: "email")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(lastModifyTime, forKey: "lastModifyTime")
        try container.encodeIfPresent(loginName, forKey: "loginName")
        try container.encodeIfPresent(loginPass, forKey: "loginPass")
        try container.encodeIfPresent(mobile, forKey: "mobile")
        try container.encodeIfPresent(nickname, forKey: "nickname")
        try container.encodeIfPresent(paymentPass, forKey: "paymentPass")
        try container.encodeIfPresent(version, forKey: "version")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        about = try container.decodeIfPresent(String.self, forKey: "about")
        activated = try container.decodeIfPresent(Bool.self, forKey: "activated")
        avatar = try container.decodeIfPresent(String.self, forKey: "avatar")
        createTime = try container.decodeIfPresent(Int64.self, forKey: "createTime")
        email = try container.decodeIfPresent(String.self, forKey: "email")
        id = try container.decodeIfPresent(Int64.self, forKey: "id")
        lastModifyTime = try container.decodeIfPresent(Int64.self, forKey: "lastModifyTime")
        loginName = try container.decodeIfPresent(String.self, forKey: "loginName")
        loginPass = try container.decodeIfPresent(String.self, forKey: "loginPass")
        mobile = try container.decodeIfPresent(String.self, forKey: "mobile")
        nickname = try container.decodeIfPresent(String.self, forKey: "nickname")
        paymentPass = try container.decodeIfPresent(String.self, forKey: "paymentPass")
        version = try container.decodeIfPresent(Int64.self, forKey: "version")
    }
}

