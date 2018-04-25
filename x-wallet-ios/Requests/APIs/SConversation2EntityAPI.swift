//
// SConversation2EntityAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SConversation2EntityAPI {
    /**
     sConversation2Creator
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2CreatorUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sConversation2CreatorUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sConversation2Creator
     - DELETE /sConversation2s/{id}/creator
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sConversation2CreatorUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sConversation2s/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversation2Creator
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2CreatorUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2CreatorUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Creator
     - GET /sConversation2s/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2CreatorUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversation2Creator
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2CreatorUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2CreatorUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Creator
     - PATCH /sConversation2s/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2CreatorUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversation2Creator
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2CreatorUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2CreatorUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Creator
     - POST /sConversation2s/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2CreatorUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversation2Creator
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2CreatorUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2CreatorUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Creator
     - PUT /sConversation2s/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2CreatorUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversation2Partner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2PartnerUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sConversation2PartnerUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sConversation2Partner
     - DELETE /sConversation2s/{id}/partner
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sConversation2PartnerUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sConversation2s/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversation2Partner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2PartnerUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2PartnerUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Partner
     - GET /sConversation2s/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2PartnerUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversation2Partner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2PartnerUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2PartnerUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Partner
     - PATCH /sConversation2s/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2PartnerUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversation2Partner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2PartnerUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2PartnerUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Partner
     - POST /sConversation2s/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2PartnerUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversation2Partner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversation2PartnerUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversation2PartnerUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversation2Partner
     - PUT /sConversation2s/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversation2PartnerUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversation2s/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
