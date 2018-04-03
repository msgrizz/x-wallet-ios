//
// SMiniCoinPoolEntityAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SMiniCoinPoolEntityAPI {
    /**
     deleteSMiniCoinPool
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteSMiniCoinPoolUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        deleteSMiniCoinPoolUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     deleteSMiniCoinPool
     - DELETE /sMiniCoinPools/{id}
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteSMiniCoinPoolUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sMiniCoinPools/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     findAllSMiniCoinPool
     
     - parameter page: (query) page (optional)
     - parameter size: (query) size (optional)
     - parameter sort: (query) sort (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findAllSMiniCoinPoolUsingGET(page: String? = nil, size: String? = nil, sort: String? = nil, completion: @escaping ((_ data: ResourcesSMiniCoinPool?,_ error: Error?) -> Void)) {
        findAllSMiniCoinPoolUsingGETWithRequestBuilder(page: page, size: size, sort: sort).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     findAllSMiniCoinPool
     - GET /sMiniCoinPools
     - examples: [{contentType=application/json, example={
  "links" : [ {
    "templated" : true,
    "rel" : "rel",
    "href" : "href"
  }, {
    "templated" : true,
    "rel" : "rel",
    "href" : "href"
  } ],
  "content" : [ {
    "important" : true,
    "createTime" : 0,
    "lastModifyTime" : 5,
    "transferable" : true,
    "name" : "name",
    "logo" : "logo",
    "fixed" : 6,
    "id" : 1,
    "version" : 5,
    "content" : "content",
    "issuer" : {
      "about" : "about",
      "mobile" : "mobile",
      "avatar" : "avatar",
      "version" : 5,
      "createTime" : 0,
      "lastModifyTime" : 1,
      "loginName" : "loginName",
      "nickname" : "nickname",
      "loginPass" : "loginPass",
      "paymentPass" : "paymentPass",
      "id" : 6,
      "email" : "email",
      "activated" : true
    },
    "activated" : true
  }, {
    "important" : true,
    "createTime" : 0,
    "lastModifyTime" : 5,
    "transferable" : true,
    "name" : "name",
    "logo" : "logo",
    "fixed" : 6,
    "id" : 1,
    "version" : 5,
    "content" : "content",
    "issuer" : {
      "about" : "about",
      "mobile" : "mobile",
      "avatar" : "avatar",
      "version" : 5,
      "createTime" : 0,
      "lastModifyTime" : 1,
      "loginName" : "loginName",
      "nickname" : "nickname",
      "loginPass" : "loginPass",
      "paymentPass" : "paymentPass",
      "id" : 6,
      "email" : "email",
      "activated" : true
    },
    "activated" : true
  } ]
}}]
     
     - parameter page: (query) page (optional)
     - parameter size: (query) size (optional)
     - parameter sort: (query) sort (optional)

     - returns: RequestBuilder<ResourcesSMiniCoinPool> 
     */
    open class func findAllSMiniCoinPoolUsingGETWithRequestBuilder(page: String? = nil, size: String? = nil, sort: String? = nil) -> RequestBuilder<ResourcesSMiniCoinPool> {
        let path = "/sMiniCoinPools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "page": page, 
            "size": size, 
            "sort": sort
        ])
        

        let requestBuilder: RequestBuilder<ResourcesSMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     findOneSMiniCoinPool
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findOneSMiniCoinPoolUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSMiniCoinPool?,_ error: Error?) -> Void)) {
        findOneSMiniCoinPoolUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     findOneSMiniCoinPool
     - GET /sMiniCoinPools/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSMiniCoinPool> 
     */
    open class func findOneSMiniCoinPoolUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSMiniCoinPool> {
        var path = "/sMiniCoinPools/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMiniCoinPoolIssuer
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMiniCoinPoolIssuerUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        sMiniCoinPoolIssuerUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     sMiniCoinPoolIssuer
     - DELETE /sMiniCoinPools/{id}/issuer
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func sMiniCoinPoolIssuerUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sMiniCoinPools/{id}/issuer"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMiniCoinPoolIssuer
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMiniCoinPoolIssuerUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMiniCoinPoolIssuerUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMiniCoinPoolIssuer
     - GET /sMiniCoinPools/{id}/issuer
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMiniCoinPoolIssuerUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMiniCoinPools/{id}/issuer"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMiniCoinPoolIssuer
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMiniCoinPoolIssuerUsingPATCH(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMiniCoinPoolIssuerUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMiniCoinPoolIssuer
     - PATCH /sMiniCoinPools/{id}/issuer
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMiniCoinPoolIssuerUsingPATCHWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMiniCoinPools/{id}/issuer"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMiniCoinPoolIssuer
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMiniCoinPoolIssuerUsingPOST(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMiniCoinPoolIssuerUsingPOSTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMiniCoinPoolIssuer
     - POST /sMiniCoinPools/{id}/issuer
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMiniCoinPoolIssuerUsingPOSTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMiniCoinPools/{id}/issuer"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMiniCoinPoolIssuer
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMiniCoinPoolIssuerUsingPUT(id: Int64, body: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        sMiniCoinPoolIssuerUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMiniCoinPoolIssuer
     - PUT /sMiniCoinPools/{id}/issuer
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func sMiniCoinPoolIssuerUsingPUTWithRequestBuilder(id: Int64, body: String) -> RequestBuilder<ResourceSAccount> {
        var path = "/sMiniCoinPools/{id}/issuer"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     saveSMiniCoinPool
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func saveSMiniCoinPoolUsingPATCH(id: Int64, body: SMiniCoinPool, completion: @escaping ((_ data: ResourceSMiniCoinPool?,_ error: Error?) -> Void)) {
        saveSMiniCoinPoolUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     saveSMiniCoinPool
     - PATCH /sMiniCoinPools/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSMiniCoinPool> 
     */
    open class func saveSMiniCoinPoolUsingPATCHWithRequestBuilder(id: Int64, body: SMiniCoinPool) -> RequestBuilder<ResourceSMiniCoinPool> {
        var path = "/sMiniCoinPools/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     saveSMiniCoinPool
     
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func saveSMiniCoinPoolUsingPOST(body: SMiniCoinPool, completion: @escaping ((_ data: ResourceSMiniCoinPool?,_ error: Error?) -> Void)) {
        saveSMiniCoinPoolUsingPOSTWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     saveSMiniCoinPool
     - POST /sMiniCoinPools
     - examples: [{output=none}]
     
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSMiniCoinPool> 
     */
    open class func saveSMiniCoinPoolUsingPOSTWithRequestBuilder(body: SMiniCoinPool) -> RequestBuilder<ResourceSMiniCoinPool> {
        let path = "/sMiniCoinPools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     saveSMiniCoinPool
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func saveSMiniCoinPoolUsingPUT(id: Int64, body: SMiniCoinPool, completion: @escaping ((_ data: ResourceSMiniCoinPool?,_ error: Error?) -> Void)) {
        saveSMiniCoinPoolUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     saveSMiniCoinPool
     - PUT /sMiniCoinPools/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSMiniCoinPool> 
     */
    open class func saveSMiniCoinPoolUsingPUTWithRequestBuilder(id: Int64, body: SMiniCoinPool) -> RequestBuilder<ResourceSMiniCoinPool> {
        var path = "/sMiniCoinPools/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
