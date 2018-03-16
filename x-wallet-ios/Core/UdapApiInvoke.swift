//
//  UdapApiInvoke.swift
//  x-wallet-ios
//
//  Created by Evrins Hu on 15/03/2018.
//  Copyright © 2018 linkio. All rights reserved.
//

import Foundation
import TrezorCrypto

public struct UdapApiInvoke: Codable {
    public var _protocol: String
    public var application: String
    public var method: String
    public var timestamp: Int
    public var sequence = UUID().uuidString
    public var body: String
    // set to null while sign, implied by ecrecover
    // base64 encoded [UInt8]
    public var sender: String?
    public var signature: String?//set to null while sign

    enum CodingKeys: String, CodingKey {
        case _protocol = "protocol"
        case application
        case method
        case timestamp
        case sequence
        case body
        case sender
        case signature
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_protocol, forKey: ._protocol)
        try container.encode(application, forKey: .application)
        try container.encode(method, forKey: .method)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(sequence, forKey: .sequence)
        try container.encode(body, forKey: .body)
        try container.encode(sender, forKey: .sender)
        try container.encode(signature, forKey: .signature)
    }
}

extension String {
    var hexaBytes: [UInt8] {
        var position = startIndex
        return (0..<count / 2).flatMap { _ in
            defer {
                position = index(position, offsetBy: 2)
            }
            return UInt8(self[position...index(after: position)], radix: 16)
        }
    }
    var hexaData: Data {
        return hexaBytes.data
    }
}

extension Collection where Iterator.Element == UInt8 {
    var data: Data {
        return Data(self)
    }
    var hexa: String {
        return map {
            String(format: "%02X", $0)
        }.joined()
    }
}