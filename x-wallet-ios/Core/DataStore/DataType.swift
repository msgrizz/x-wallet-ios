// Copyright © 2017 Trust.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import Foundation

public enum DataType:String, Codable{
    case Contact, Forget, Info, Mac, MnemonicWord, PrivateKey, Profile, Timestamp;
    
}
