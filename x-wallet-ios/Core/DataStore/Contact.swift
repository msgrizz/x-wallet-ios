// Copyright © 2017 Trust.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import Foundation

public struct Contact : Codable{
    public var contactAddress: [UInt8]
    public var contactProfile: Profile
    
    enum CodingKeys: String, CodingKey {
        case contactAddress = "contact_address"
        case contactProfile = "contact_profile"
    }
}
