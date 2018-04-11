//
// SMessageDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class SMessageDTO: Codable {

    public enum MessageType: String, Codable { 
        case text = "Text"
        case image = "Image"
        case url = "Url"
    }
    public var sConversation: Int64?
    public var sconversation: Int64?
    public var messageType: MessageType?
    public var content: String?
    public var sender: Int64?


    
    public init(sConversation: Int64?, sconversation: Int64?, messageType: MessageType?, content: String?, sender: Int64?) {
        self.sConversation = sConversation
        self.sconversation = sconversation
        self.messageType = messageType
        self.content = content
        self.sender = sender
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(sConversation, forKey: "sConversation")
        try container.encodeIfPresent(sconversation, forKey: "sconversation")
        try container.encodeIfPresent(messageType, forKey: "messageType")
        try container.encodeIfPresent(content, forKey: "content")
        try container.encodeIfPresent(sender, forKey: "sender")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        sConversation = try container.decodeIfPresent(Int64.self, forKey: "sConversation")
        sconversation = try container.decodeIfPresent(Int64.self, forKey: "sconversation")
        messageType = try container.decodeIfPresent(MessageType.self, forKey: "messageType")
        content = try container.decodeIfPresent(String.self, forKey: "content")
        sender = try container.decodeIfPresent(Int64.self, forKey: "sender")
    }
}

