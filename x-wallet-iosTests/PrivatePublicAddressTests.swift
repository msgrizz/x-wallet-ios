//
//  PrivatePublicAddressTests.swift
//  x-wallet-iosTests
//
//  Created by Evrins Hu on 15/03/2018.
//  Copyright © 2018 linkio. All rights reserved.
//

@testable import x_wallet_ios
import XCTest
import CryptoSwift

class PrivatePublicAddressTests: XCTestCase {
    let privateHex = "bf0be042d723f26a15e5a787b55e27df721b38a59e1c6bdde6e8d5cdc29d37b0"
    let privateKey = Data(hexString: "bf0be042d723f26a15e5a787b55e27df721b38a59e1c6bdde6e8d5cdc29d37b0")!
    let addressString = "0768f3889877330f5171c062ca13b1acd09ebfa3"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSign() throws {
        var ppa = PrivatePublicAddress(privateKey: privateKey)
        print(ppa)
        var uai = UdapApiInvoke(_protocol: "v1",
                application: "Global",
                method: "test1",
                timestamp: 1520924471000,
                sequence: "9d5e642758b8488e",
                body: "123123123",
                sender: nil,
                signature: nil
        )
        uai = ppa.signUdapApiInvoke(udapApiInvoke: &uai, overwrite: true)

        let sig = "eec5cd0e9a28f1a2d85bd290073ac2c4fe20c709157496943b73ed90a3567a8440cd45ed276e753c65b9f6ec054ba2516ee768456833b684d9338f43419abdb11b"
        let hashHex = "7ee9839932f1b600ac8711d369a046c1fe3daed4e14fab534001fee490bb4656"
        XCTAssertEqual(uai.signature!, sig)
    }

    func testAddress() throws {
        var address = Secp256k1().address(from: privateKey)
        print(address)
        print(address.hexString)
        XCTAssertEqual(address.hexString, addressString)
    }
}