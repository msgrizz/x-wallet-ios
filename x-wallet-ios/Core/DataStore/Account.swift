//
//  Account.swift
//  demo
//
//  Created by Evrins Hu on 13/03/2018.
//  Copyright © 2018 iClass. All rights reserved.
//

import Foundation

public struct Account: Codable {
    public var applicationAddress: [UInt8]
    public var address: [UInt8]
    
    enum CodingKeys: String, CodingKey {
        case applicationAddress = "application_address"
        case address
    }
}
