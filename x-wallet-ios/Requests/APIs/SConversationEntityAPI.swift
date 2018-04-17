//
// SConversationEntityAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SConversationEntityAPI {
    /**
     sConversationCreator
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationCreatorUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sConversationCreatorUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sConversationCreator
     - DELETE /sConversations/{id}/creator
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sConversationCreatorUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sConversations/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversationCreator
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationCreatorUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationCreatorUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationCreator
     - GET /sConversations/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationCreatorUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversationCreator
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationCreatorUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationCreatorUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationCreator
     - PATCH /sConversations/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationCreatorUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversationCreator
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationCreatorUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationCreatorUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationCreator
     - POST /sConversations/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationCreatorUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversationCreator
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationCreatorUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationCreatorUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationCreator
     - PUT /sConversations/{id}/creator
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationCreatorUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/creator"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversationPartner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationPartnerUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sConversationPartnerUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sConversationPartner
     - DELETE /sConversations/{id}/partner
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sConversationPartnerUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sConversations/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversationPartner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationPartnerUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationPartnerUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationPartner
     - GET /sConversations/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationPartnerUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sConversationPartner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationPartnerUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationPartnerUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationPartner
     - PATCH /sConversations/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationPartnerUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversationPartner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationPartnerUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationPartnerUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationPartner
     - POST /sConversations/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationPartnerUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sConversationPartner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sConversationPartnerUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sConversationPartnerUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sConversationPartner
     - PUT /sConversations/{id}/partner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sConversationPartnerUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sConversations/{id}/partner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}