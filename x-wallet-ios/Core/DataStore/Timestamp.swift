//
//  Timestamp.swift
//  demo
//
//  Created by Evrins Hu on 13/03/2018.
//  Copyright © 2018 iClass. All rights reserved.
//

import Foundation

public struct Timestamp : Codable{
    public var address:[UInt8]
    public var lastLogin: UInt64
    
    enum CodingKeys: String, CodingKey {
        case address
        case lastLogin="last_login"
    }
}
