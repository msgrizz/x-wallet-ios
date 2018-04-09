//
// SignInDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SignInDTO: Codable {

    public var loginName: String?
    public var loginPass: String?


    
    public init(loginName: String?, loginPass: String?) {
        self.loginName = loginName
        self.loginPass = loginPass
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(loginName, forKey: "loginName")
        try container.encodeIfPresent(loginPass, forKey: "loginPass")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        loginName = try container.decodeIfPresent(String.self, forKey: "loginName")
        loginPass = try container.decodeIfPresent(String.self, forKey: "loginPass")
    }
}
