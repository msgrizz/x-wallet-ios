// Copyright © 2017 Trust.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import Foundation

public struct Profile : Codable{
    public var index : Int
    public var nickName: String
    public var email: String
    public var introduction: String
    
    enum CodingKeys: String, CodingKey {
        case index
        case nickName = "nick_name"
        case email
        case introduction
    }
}
