//
//  walletTests.swift
//  x-wallet-iosTests
//
//  Created by Evrins Hu on 14/03/2018.
//  Copyright © 2018 linkio. All rights reserved.
//

@testable import x_wallet_ios
import XCTest

class walletTests: XCTestCase {
    
    let words = "innocent drive any public eight tray fold weapon syrup visa license gain tenant seed useful gloom file size drift release use survey general first"
    let password = "testpass"
    let path = "m/44'/711'/0'/0/x"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateWallet() {
        var wallet = Wallet(mnemonic: words, passphrase: password, path: path)
        print(wallet.seed.hexString)
        print(wallet.mnemonic)
    }
    
    func testDrive() {
        var wallet = Wallet(mnemonic: words, passphrase: password, path: path)
        let key0 = wallet.getKey(at: 0)
        let key1 = wallet.getKey(at: 1)
        print(key0.address.description)
        print(key1.address.description)
    }
    
    func testGenerateMnemonic()  {
        let mWords = Mnemonic.generate(strength: 256)
        print(mWords)
    }
}
