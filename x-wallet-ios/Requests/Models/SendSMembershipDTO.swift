//
// SendSMembershipDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SendSMembershipDTO: Codable {

    public var accountIds: [Int64]?


    
    public init(accountIds: [Int64]?) {
        self.accountIds = accountIds
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(accountIds, forKey: "accountIds")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        accountIds = try container.decodeIfPresent([Int64].self, forKey: "accountIds")
    }
}

