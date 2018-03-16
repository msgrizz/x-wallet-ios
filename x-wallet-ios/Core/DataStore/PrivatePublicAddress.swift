//
// Created by Evrins Hu on 15/03/2018.
// Copyright (c) 2018 linkio. All rights reserved.
//

import Foundation
import CryptoSwift


public class PrivatePublicAddress {
    private var privateKey: Data

    init(privateKey: Data) {
        precondition(privateKey.count == 32, "Expect private key size to be 32")
        self.privateKey = privateKey
    }

    public func signSignature(udapApiInvoke: inout UdapApiInvoke, overwrite: Bool) -> String {
        var sig = ""
        if ((udapApiInvoke.signature != nil && !udapApiInvoke.signature!.isBlank) && !overwrite) {
            return sig
    }
        do {
            udapApiInvoke.sender = Secp256k1().address(from: self.privateKey).base64EncodedString()
            let encoder = JSONEncoder()
            encoder.outputFormatting = JSONEncoder.OutputFormatting.sortedKeys
            let jsonData = try encoder.encode(udapApiInvoke)
            let jsonString = String(data: jsonData, encoding: .utf8)
            let hash = jsonData.sha3(.keccak256)
            let signedData = try Secp256k1().sign(hash: hash, privateKey: self.privateKey)
            sig = signedData.hexString
        } catch {
            return sig
        }
        return sig
    }

    public func signUdapApiInvoke(udapApiInvoke: inout UdapApiInvoke, overwrite: Bool) -> UdapApiInvoke{
        udapApiInvoke.signature = self.signSignature(udapApiInvoke: &udapApiInvoke, overwrite: overwrite)
        return udapApiInvoke
    }
}

extension String {
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
