//
// ResourcesSMiniCoinPool.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ResourcesSMiniCoinPool: Codable {

    public var content: [SMiniCoinPool]?
    public var links: [Link]?


    
    public init(content: [SMiniCoinPool]?, links: [Link]?) {
        self.content = content
        self.links = links
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(content, forKey: "content")
        try container.encodeIfPresent(links, forKey: "links")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        content = try container.decodeIfPresent([SMiniCoinPool].self, forKey: "content")
        links = try container.decodeIfPresent([Link].self, forKey: "links")
    }
}

