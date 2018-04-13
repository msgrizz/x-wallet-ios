//
// DashboardDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public enum DashboardType: String, Codable {
    case miniContract = "MiniContract"
    case miniCoin = "MiniCoin"
    case coupon = "Coupon"
    case membership = "Membership"
    case ticket = "Ticket"
    case academic = "Academic"
    case health = "Health"
    case invoice = "Invoice"
}

open class DashboardDTO: Codable {

    public var dashboardType: DashboardType?
    public var data: [DashboardDataDTO]?
    public var logo: String?


    
    public init(dashboardType: DashboardType?, data: [DashboardDataDTO]?, logo: String?) {
        self.dashboardType = dashboardType
        self.data = data
        self.logo = logo
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(dashboardType, forKey: "dashboardType")
        try container.encodeIfPresent(data, forKey: "data")
        try container.encodeIfPresent(logo, forKey: "logo")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        dashboardType = try container.decodeIfPresent(DashboardType.self, forKey: "dashboardType")
        data = try container.decodeIfPresent([DashboardDataDTO].self, forKey: "data")
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
    }
}

