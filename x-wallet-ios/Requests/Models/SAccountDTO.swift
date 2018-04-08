//
// SAccountDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SAccountDTO: Codable {

    public var loginName: String?
    public var nickname: String?
    public var loginPass: String?
    public var paymentPass: String?
    public var mobile: String?
    public var email: String?
    public var about: String?
    public var avatar: String?
    public var credit: Int64?


    
    public init(loginName: String?, nickname: String?, loginPass: String?, paymentPass: String?, mobile: String?, email: String?, about: String?, avatar: String?, credit: Int64?) {
        self.loginName = loginName
        self.nickname = nickname
        self.loginPass = loginPass
        self.paymentPass = paymentPass
        self.mobile = mobile
        self.email = email
        self.about = about
        self.avatar = avatar
        self.credit = credit
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(loginName, forKey: "loginName")
        try container.encodeIfPresent(nickname, forKey: "nickname")
        try container.encodeIfPresent(loginPass, forKey: "loginPass")
        try container.encodeIfPresent(paymentPass, forKey: "paymentPass")
        try container.encodeIfPresent(mobile, forKey: "mobile")
        try container.encodeIfPresent(email, forKey: "email")
        try container.encodeIfPresent(about, forKey: "about")
        try container.encodeIfPresent(avatar, forKey: "avatar")
        try container.encodeIfPresent(credit, forKey: "credit")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        loginName = try container.decodeIfPresent(String.self, forKey: "loginName")
        nickname = try container.decodeIfPresent(String.self, forKey: "nickname")
        loginPass = try container.decodeIfPresent(String.self, forKey: "loginPass")
        paymentPass = try container.decodeIfPresent(String.self, forKey: "paymentPass")
        mobile = try container.decodeIfPresent(String.self, forKey: "mobile")
        email = try container.decodeIfPresent(String.self, forKey: "email")
        about = try container.decodeIfPresent(String.self, forKey: "about")
        avatar = try container.decodeIfPresent(String.self, forKey: "avatar")
        credit = try container.decodeIfPresent(Int64.self, forKey: "credit")
    }
}

