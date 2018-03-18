// Copyright © 2017 Trust.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import Foundation

public struct Forget: Codable{
    public var loginPassword: [UInt8]
    public var paymentPassword: [UInt8]

    enum CodingKeys: String, CodingKey {
        case loginPassword="login_password"
        case paymentPassword="payment_password"
    }
}
