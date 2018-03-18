//
//  MnemonicWord.swift
//  demo
//
//  Created by Evrins Hu on 13/03/2018.
//  Copyright © 2018 iClass. All rights reserved.
//

import Foundation

public struct MnemonicWord: Codable {
    public var wordList : [String]
    public var language : String
    public var seed : [UInt8]
    
    enum CodingKeys: String, CodingKey {
        case wordList = "word_list"
        case language
        case seed
    }
}
