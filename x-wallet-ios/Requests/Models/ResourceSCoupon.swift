//
// ResourceSCoupon.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class ResourceSCoupon: Codable {

    public enum CouponType: String, Codable { 
        case 满减 = "满减"
        case 抵用 = "抵用"
        case 折扣 = "折扣"
        case 兑换 = "兑换"
    }
    public var activated: Bool?
    /** 抵用 - 抵用数量 */
    public var amount: Int64?
    public var couponType: CouponType?
    public var createTime: Int64?
    public var creator: SAccount?
    /** 满减 - 减多少 */
    public var cut: Int64?
    /** 抵用 - 折扣 整型 */
    public var discount: Int64?
    /** 过期日期 */
    public var expiredAt: Int64?
    /** 满减 - 满多少 */
    public var full: Int64?
    /** 兑换 - 兑换物品图片url */
    public var goodsUrl: String?
    public var id: Int64?
    /** 是否已经发行 */
    public var issued: Bool?
    /** 发行数量 */
    public var issuedNum: Int64?
    public var lastModifyTime: Int64?
    public var links: [Link]?
    /** 图标 */
    public var logo: String?
    /** 名称 */
    public var name: String?
    /** 备注 */
    public var remarks: String?
    /** 可否转移 */
    public var transferable: Bool?
    public var version: Int64?


    
    public init(activated: Bool?, amount: Int64?, couponType: CouponType?, createTime: Int64?, creator: SAccount?, cut: Int64?, discount: Int64?, expiredAt: Int64?, full: Int64?, goodsUrl: String?, id: Int64?, issued: Bool?, issuedNum: Int64?, lastModifyTime: Int64?, links: [Link]?, logo: String?, name: String?, remarks: String?, transferable: Bool?, version: Int64?) {
        self.activated = activated
        self.amount = amount
        self.couponType = couponType
        self.createTime = createTime
        self.creator = creator
        self.cut = cut
        self.discount = discount
        self.expiredAt = expiredAt
        self.full = full
        self.goodsUrl = goodsUrl
        self.id = id
        self.issued = issued
        self.issuedNum = issuedNum
        self.lastModifyTime = lastModifyTime
        self.links = links
        self.logo = logo
        self.name = name
        self.remarks = remarks
        self.transferable = transferable
        self.version = version
    }
    

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(activated, forKey: "activated")
        try container.encodeIfPresent(amount, forKey: "amount")
        try container.encodeIfPresent(couponType, forKey: "couponType")
        try container.encodeIfPresent(createTime, forKey: "createTime")
        try container.encodeIfPresent(creator, forKey: "creator")
        try container.encodeIfPresent(cut, forKey: "cut")
        try container.encodeIfPresent(discount, forKey: "discount")
        try container.encodeIfPresent(expiredAt, forKey: "expiredAt")
        try container.encodeIfPresent(full, forKey: "full")
        try container.encodeIfPresent(goodsUrl, forKey: "goodsUrl")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(issued, forKey: "issued")
        try container.encodeIfPresent(issuedNum, forKey: "issuedNum")
        try container.encodeIfPresent(lastModifyTime, forKey: "lastModifyTime")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encodeIfPresent(logo, forKey: "logo")
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(remarks, forKey: "remarks")
        try container.encodeIfPresent(transferable, forKey: "transferable")
        try container.encodeIfPresent(version, forKey: "version")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        activated = try container.decodeIfPresent(Bool.self, forKey: "activated")
        amount = try container.decodeIfPresent(Int64.self, forKey: "amount")
        couponType = try container.decodeIfPresent(CouponType.self, forKey: "couponType")
        createTime = try container.decodeIfPresent(Int64.self, forKey: "createTime")
        creator = try container.decodeIfPresent(SAccount.self, forKey: "creator")
        cut = try container.decodeIfPresent(Int64.self, forKey: "cut")
        discount = try container.decodeIfPresent(Int64.self, forKey: "discount")
        expiredAt = try container.decodeIfPresent(Int64.self, forKey: "expiredAt")
        full = try container.decodeIfPresent(Int64.self, forKey: "full")
        goodsUrl = try container.decodeIfPresent(String.self, forKey: "goodsUrl")
        id = try container.decodeIfPresent(Int64.self, forKey: "id")
        issued = try container.decodeIfPresent(Bool.self, forKey: "issued")
        issuedNum = try container.decodeIfPresent(Int64.self, forKey: "issuedNum")
        lastModifyTime = try container.decodeIfPresent(Int64.self, forKey: "lastModifyTime")
        links = try container.decodeIfPresent([Link].self, forKey: "links")
        logo = try container.decodeIfPresent(String.self, forKey: "logo")
        name = try container.decodeIfPresent(String.self, forKey: "name")
        remarks = try container.decodeIfPresent(String.self, forKey: "remarks")
        transferable = try container.decodeIfPresent(Bool.self, forKey: "transferable")
        version = try container.decodeIfPresent(Int64.self, forKey: "version")
    }
}

