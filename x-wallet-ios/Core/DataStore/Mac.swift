//
//  Mac.swift
//  demo
//
//  Created by Evrins Hu on 13/03/2018.
//  Copyright © 2018 iClass. All rights reserved.
//

import Foundation

public struct Mac : Codable {
    public var hmac: String;
    
    enum CodingKeys: String, CodingKey {
        case hmac
    }
}
