//
// SCouponOwnerEntityAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SCouponOwnerEntityAPI {
    /**
     sCouponOwnerOwner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerOwnerUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sCouponOwnerOwnerUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sCouponOwnerOwner
     - DELETE /sCouponOwners/{id}/owner
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sCouponOwnerOwnerUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sCouponOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sCouponOwnerOwner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerOwnerUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sCouponOwnerOwnerUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerOwner
     - GET /sCouponOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sCouponOwnerOwnerUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sCouponOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sCouponOwnerOwner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerOwnerUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sCouponOwnerOwnerUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerOwner
     - PATCH /sCouponOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sCouponOwnerOwnerUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sCouponOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sCouponOwnerOwner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerOwnerUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sCouponOwnerOwnerUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerOwner
     - POST /sCouponOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sCouponOwnerOwnerUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sCouponOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sCouponOwnerOwner
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerOwnerUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sCouponOwnerOwnerUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerOwner
     - PUT /sCouponOwners/{id}/owner
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sCouponOwnerOwnerUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sCouponOwners/{id}/owner"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sCouponOwnerSCoupon
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerSCouponUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sCouponOwnerSCouponUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sCouponOwnerSCoupon
     - DELETE /sCouponOwners/{id}/sCoupon
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sCouponOwnerSCouponUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sCouponOwners/{id}/sCoupon"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sCouponOwnerSCoupon
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerSCouponUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSCoupon?,_ error: Error?) -> Void)) {
        sCouponOwnerSCouponUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerSCoupon
     - GET /sCouponOwners/{id}/sCoupon
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSCoupon> 
     */
    open class func sCouponOwnerSCouponUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSCoupon> {
        var path = "/sCouponOwners/{id}/sCoupon"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSCoupon>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sCouponOwnerSCoupon
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerSCouponUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSCoupon?,_ error: Error?) -> Void)) {
        sCouponOwnerSCouponUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerSCoupon
     - PATCH /sCouponOwners/{id}/sCoupon
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSCoupon> 
     */
    open class func sCouponOwnerSCouponUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSCoupon> {
        var path = "/sCouponOwners/{id}/sCoupon"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSCoupon>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sCouponOwnerSCoupon
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerSCouponUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSCoupon?,_ error: Error?) -> Void)) {
        sCouponOwnerSCouponUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerSCoupon
     - POST /sCouponOwners/{id}/sCoupon
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSCoupon> 
     */
    open class func sCouponOwnerSCouponUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSCoupon> {
        var path = "/sCouponOwners/{id}/sCoupon"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSCoupon>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sCouponOwnerSCoupon
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sCouponOwnerSCouponUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSCoupon?,_ error: Error?) -> Void)) {
        sCouponOwnerSCouponUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sCouponOwnerSCoupon
     - PUT /sCouponOwners/{id}/sCoupon
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSCoupon> 
     */
    open class func sCouponOwnerSCouponUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSCoupon> {
        var path = "/sCouponOwners/{id}/sCoupon"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSCoupon>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}