//
// ResourcesListSNotification.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ResourcesListSNotification: Codable {

    public var content: [[SNotification]]?
    public var links: [Link]?


    
    public init(content: [[SNotification]]?, links: [Link]?) {
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

        content = try container.decodeIfPresent([[SNotification]].self, forKey: "content")
        links = try container.decodeIfPresent([Link].self, forKey: "links")
    }
}

