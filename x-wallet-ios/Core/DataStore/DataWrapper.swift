// Copyright © 2017 Trust.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import CryptoSwift
import Foundation
import secp256k1_ios
import Security

public struct DataWrapper {
    public var address : DataType
    public var crypto: KeystoreKeyHeader
    public var id : String?
    public var version = 3
    public var url : URL?
    
    public init(password: String, dataStore: Data, dataType: DataType) throws {
        id = UUID().uuidString.lowercased()
        let cipherParams = CipherParams()
        let kdfParams = ScryptParams()
        
        let scrypt = Scrypt(params: kdfParams)
        let derivedKey = try scrypt.calculate(password: password)

        let encryptionKey = derivedKey[0...15]
        let aecCipher = try AES(key: encryptionKey.bytes, blockMode: .CTR(iv: cipherParams.iv.bytes), padding: .noPadding)
        
        let encryptedDataStore = try aecCipher.encrypt(dataStore.bytes)
        let prefix = derivedKey[(derivedKey.count - 16) ..< derivedKey.count]
        let mac = DataWrapper.computeMAC(prefix: prefix, key: Data(bytes: encryptedDataStore))
        crypto =  KeystoreKeyHeader(cipherText: Data(bytes: encryptedDataStore), cipherParams: cipherParams, kdfParams: kdfParams, mac: mac)
        address = dataType
    }
    
    public init(contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self = try JSONDecoder().decode(DataWrapper.self, from: data)
    }
    
    public func decrypt(password: String) throws -> Data {
        let derivedKey: Data
        switch crypto.kdf {
        case "scrypt":
            let scrypt = Scrypt(params: crypto.kdfParams)
            derivedKey = try scrypt.calculate(password: password)
        default:
            throw DecryptError.unsupportedKDF
        }
        
        let mac = DataWrapper.computeMAC(prefix: derivedKey[derivedKey.count - 16 ..< derivedKey.count], key: crypto.cipherText)
        if mac != crypto.mac {
            throw DecryptError.invalidPassword
        }
        
        let decryptionKey = derivedKey[0...15]
        let decryptedPK: [UInt8]
        switch crypto.cipher {
        case "aes-128-ctr":
            let aesCipher = try AES(key: decryptionKey.bytes, blockMode: .CTR(iv: crypto.cipherParams.iv.bytes), padding: .noPadding)
            decryptedPK = try aesCipher.decrypt(crypto.cipherText.bytes)
        case "aes-128-cbc":
            let aesCipher = try AES(key: decryptionKey.bytes, blockMode: .CBC(iv: crypto.cipherParams.iv.bytes), padding: .noPadding)
            decryptedPK = try aesCipher.decrypt(crypto.cipherText.bytes)
        default:
            throw DecryptError.unsupportedCipher
        }
        
        return Data(bytes: decryptedPK)
    }
    
    private static func computeMAC(prefix: Data, key: Data) -> Data {
        var data = Data(capacity: prefix.count + key.count)
        data.append(prefix)
        data.append(key)
        return data.sha3(.keccak256)
    }
    
    
}

extension DataWrapper: Codable {
    enum CodingKeys: String, CodingKey {
        case address
        case id
        case crypto
        case version
    }
    
    enum UppercaseCodingKeys: String, CodingKey {
        case crypto = "Crypto"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let altValues = try decoder.container(keyedBy: UppercaseCodingKeys.self)
        address = try values.decode(DataType.self, forKey: .address)
        id = try values.decode(String.self, forKey: .id)
        if let crypto = try? values.decode(KeystoreKeyHeader.self, forKey: .crypto) {
            self.crypto = crypto
        } else {
            // Workaround for myEtherWallet files
            self.crypto = try altValues.decode(KeystoreKeyHeader.self, forKey: .crypto)
        }
        version = try values.decode(Int.self, forKey: .version)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(address, forKey: .address)
        try container.encode(id, forKey: .id)
        try container.encode(crypto, forKey: .crypto)
        try container.encode(version, forKey: .version)
    }
}

