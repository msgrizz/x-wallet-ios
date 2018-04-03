//
// SAccountEntityAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SAccountEntityAPI {
    /**
     deleteSAccount
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteSAccountUsingDELETE(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        deleteSAccountUsingDELETEWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     deleteSAccount
     - DELETE /sAccounts/{id}
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteSAccountUsingDELETEWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/sAccounts/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     existsAccountByLoginNameSAccount
     
     - parameter loginName: (query) loginName 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func existsAccountByLoginNameSAccountUsingGET(loginName: String, completion: @escaping ((_ data: Bool?,_ error: Error?) -> Void)) {
        existsAccountByLoginNameSAccountUsingGETWithRequestBuilder(loginName: loginName).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     existsAccountByLoginNameSAccount
     - GET /sAccounts/search/existsAccountByLoginName
     - examples: [{output=none}]
     
     - parameter loginName: (query) loginName 

     - returns: RequestBuilder<Bool> 
     */
    open class func existsAccountByLoginNameSAccountUsingGETWithRequestBuilder(loginName: String) -> RequestBuilder<Bool> {
        let path = "/sAccounts/search/existsAccountByLoginName"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "loginName": loginName
        ])
        

        let requestBuilder: RequestBuilder<Bool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     findAllSAccount
     
     - parameter page: (query) page (optional)
     - parameter size: (query) size (optional)
     - parameter sort: (query) sort (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findAllSAccountUsingGET(page: String? = nil, size: String? = nil, sort: String? = nil, completion: @escaping ((_ data: ResourcesSAccount?,_ error: Error?) -> Void)) {
        findAllSAccountUsingGETWithRequestBuilder(page: page, size: size, sort: sort).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     findAllSAccount
     - GET /sAccounts
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
    "createTime" : 0,
    "lastModifyTime" : 1,
    "loginName" : "loginName",
    "about" : "about",
    "mobile" : "mobile",
    "nickname" : "nickname",
    "loginPass" : "loginPass",
    "paymentPass" : "paymentPass",
    "id" : 6,
    "version" : 5,
    "email" : "email",
    "activated" : true
  }, {
    "createTime" : 0,
    "lastModifyTime" : 1,
    "loginName" : "loginName",
    "about" : "about",
    "mobile" : "mobile",
    "nickname" : "nickname",
    "loginPass" : "loginPass",
    "paymentPass" : "paymentPass",
    "id" : 6,
    "version" : 5,
    "email" : "email",
    "activated" : true
  } ]
}}]
     
     - parameter page: (query) page (optional)
     - parameter size: (query) size (optional)
     - parameter sort: (query) sort (optional)

     - returns: RequestBuilder<ResourcesSAccount> 
     */
    open class func findAllSAccountUsingGETWithRequestBuilder(page: String? = nil, size: String? = nil, sort: String? = nil) -> RequestBuilder<ResourcesSAccount> {
        let path = "/sAccounts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "page": page, 
            "size": size, 
            "sort": sort
        ])
        

        let requestBuilder: RequestBuilder<ResourcesSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     findFirstByLoginNameSAccount
     
     - parameter loginName: (query) loginName 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findFirstByLoginNameSAccountUsingGET(loginName: String, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        findFirstByLoginNameSAccountUsingGETWithRequestBuilder(loginName: loginName).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     findFirstByLoginNameSAccount
     - GET /sAccounts/search/findFirstByLoginName
     - examples: [{output=none}]
     
     - parameter loginName: (query) loginName 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func findFirstByLoginNameSAccountUsingGETWithRequestBuilder(loginName: String) -> RequestBuilder<ResourceSAccount> {
        let path = "/sAccounts/search/findFirstByLoginName"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "loginName": loginName
        ])
        

        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     findOneSAccount
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findOneSAccountUsingGET(id: Int64, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        findOneSAccountUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     findOneSAccount
     - GET /sAccounts/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func findOneSAccountUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<ResourceSAccount> {
        var path = "/sAccounts/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     saveSAccount
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func saveSAccountUsingPATCH(id: Int64, body: SAccount, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        saveSAccountUsingPATCHWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     saveSAccount
     - PATCH /sAccounts/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func saveSAccountUsingPATCHWithRequestBuilder(id: Int64, body: SAccount) -> RequestBuilder<ResourceSAccount> {
        var path = "/sAccounts/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     saveSAccount
     
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func saveSAccountUsingPOST(body: SAccount, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        saveSAccountUsingPOSTWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     saveSAccount
     - POST /sAccounts
     - examples: [{output=none}]
     
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func saveSAccountUsingPOSTWithRequestBuilder(body: SAccount) -> RequestBuilder<ResourceSAccount> {
        let path = "/sAccounts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     saveSAccount
     
     - parameter id: (path) id 
     - parameter body: (body) body 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func saveSAccountUsingPUT(id: Int64, body: SAccount, completion: @escaping ((_ data: ResourceSAccount?,_ error: Error?) -> Void)) {
        saveSAccountUsingPUTWithRequestBuilder(id: id, body: body).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     saveSAccount
     - PUT /sAccounts/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter body: (body) body 

     - returns: RequestBuilder<ResourceSAccount> 
     */
    open class func saveSAccountUsingPUTWithRequestBuilder(id: Int64, body: SAccount) -> RequestBuilder<ResourceSAccount> {
        var path = "/sAccounts/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResourceSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
