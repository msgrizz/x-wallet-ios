//
// SMembershipOwnerEntityAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SMembershipOwnerEntityAPI {
    /**
     sMembershipOwnerOwner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerOwnerUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sMembershipOwnerOwnerUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sMembershipOwnerOwner
     - DELETE /sMembershipOwners/{id}/owner
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sMembershipOwnerOwnerUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sMembershipOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMembershipOwnerOwner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerOwnerUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMembershipOwnerOwnerUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerOwner
     - GET /sMembershipOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMembershipOwnerOwnerUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMembershipOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMembershipOwnerOwner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerOwnerUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMembershipOwnerOwnerUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerOwner
     - PATCH /sMembershipOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMembershipOwnerOwnerUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMembershipOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMembershipOwnerOwner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerOwnerUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMembershipOwnerOwnerUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerOwner
     - POST /sMembershipOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMembershipOwnerOwnerUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMembershipOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMembershipOwnerOwner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerOwnerUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMembershipOwnerOwnerUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerOwner
     - PUT /sMembershipOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMembershipOwnerOwnerUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMembershipOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMembershipOwnerSMembership
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerSMembershipUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sMembershipOwnerSMembershipUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sMembershipOwnerSMembership
     - DELETE /sMembershipOwners/{id}/sMembership
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sMembershipOwnerSMembershipUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sMembershipOwners/{id}/sMembership"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMembershipOwnerSMembership
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerSMembershipUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSMembership?,_ error: Error?) -> Void)) {
        sMembershipOwnerSMembershipUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerSMembership
     - GET /sMembershipOwners/{id}/sMembership
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSMembership> 
     */
    open class func sMembershipOwnerSMembershipUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSMembership> {
        var path = "/sMembershipOwners/{id}/sMembership"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMembership>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMembershipOwnerSMembership
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerSMembershipUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSMembership?,_ error: Error?) -> Void)) {
        sMembershipOwnerSMembershipUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerSMembership
     - PATCH /sMembershipOwners/{id}/sMembership
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSMembership> 
     */
    open class func sMembershipOwnerSMembershipUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSMembership> {
        var path = "/sMembershipOwners/{id}/sMembership"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMembership>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMembershipOwnerSMembership
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerSMembershipUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSMembership?,_ error: Error?) -> Void)) {
        sMembershipOwnerSMembershipUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerSMembership
     - POST /sMembershipOwners/{id}/sMembership
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSMembership> 
     */
    open class func sMembershipOwnerSMembershipUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSMembership> {
        var path = "/sMembershipOwners/{id}/sMembership"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMembership>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMembershipOwnerSMembership
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerSMembershipUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSMembership?,_ error: Error?) -> Void)) {
        sMembershipOwnerSMembershipUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwnerSMembership
     - PUT /sMembershipOwners/{id}/sMembership
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSMembership> 
     */
    open class func sMembershipOwnerSMembershipUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSMembership> {
        var path = "/sMembershipOwners/{id}/sMembership"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMembership>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
