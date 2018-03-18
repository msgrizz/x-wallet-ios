//
//  DecryptError.swift
//  demo
//
//  Created by Evrins Hu on 13/03/2018.
//  Copyright © 2018 iClass. All rights reserved.
//

import Foundation

public enum DecryptError: Error {
    case unsupportedKDF
    case unsupportedCipher
    case invalidCipher
    case invalidPassword
}
