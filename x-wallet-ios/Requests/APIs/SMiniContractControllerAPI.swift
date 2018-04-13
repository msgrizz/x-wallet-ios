//
// SMiniContractControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SMiniContractControllerAPI {
    /**
     * enum for parameter miniContractType
     */
    public enum MiniContractType_getByTypeUsingGET: String { 
        case currency = "Currency"
        case receipt = "Receipt"
        case promise = "Promise"
        case iou = "Iou"
    }

    /**
     getByType
     
     - parameter miniContractType: (query) miniContractType 
     - parameter accountId: (query) accountId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getByTypeUsingGET(miniContractType: MiniContractType_getByTypeUsingGET, accountId: Int64, completion: @escaping ((_ data: [SMiniContract]?,_ error: Error?) -> Void)) {
        getByTypeUsingGETWithRequestBuilder(miniContractType: miniContractType, accountId: accountId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     getByType
     - GET /sMiniContractsByType
     - examples: [{output=none}]
     
     - parameter miniContractType: (query) miniContractType 
     - parameter accountId: (query) accountId 

     - returns: RequestBuilder<[SMiniContract]> 
     */
    open class func getByTypeUsingGETWithRequestBuilder(miniContractType: MiniContractType_getByTypeUsingGET, accountId: Int64) -> RequestBuilder<[SMiniContract]> {
        let path = "/sMiniContractsByType"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "miniContractType": miniContractType.rawValue, 
            "accountId": accountId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[SMiniContract]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     getOne
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getOneUsingGET3(id: Int64, completion: @escaping ((_ data: SMiniContract?,_ error: Error?) -> Void)) {
        getOneUsingGET3WithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     getOne
     - GET /sMiniContracts/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<SMiniContract> 
     */
    open class func getOneUsingGET3WithRequestBuilder(id: Int64) -> RequestBuilder<SMiniContract> {
        var path = "/sMiniContracts/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMiniContract>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     get
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getUsingGET2(completion: @escaping ((_ data: [SMiniContract]?,_ error: Error?) -> Void)) {
        getUsingGET2WithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     get
     - GET /sMiniContracts
     - examples: [{output=none}]

     - returns: RequestBuilder<[SMiniContract]> 
     */
    open class func getUsingGET2WithRequestBuilder() -> RequestBuilder<[SMiniContract]> {
        let path = "/sMiniContracts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[SMiniContract]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     post
     
     - parameter sMiniContractDTO: (body) sMiniContractDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postUsingPOST1(sMiniContractDTO: SMiniContractDTO, completion: @escaping ((_ data: SMiniContract?,_ error: Error?) -> Void)) {
        postUsingPOST1WithRequestBuilder(sMiniContractDTO: sMiniContractDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     post
     - POST /sMiniContracts
     - examples: [{output=none}]
     
     - parameter sMiniContractDTO: (body) sMiniContractDTO 

     - returns: RequestBuilder<SMiniContract> 
     */
    open class func postUsingPOST1WithRequestBuilder(sMiniContractDTO: SMiniContractDTO) -> RequestBuilder<SMiniContract> {
        let path = "/sMiniContracts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sMiniContractDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMiniContract>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     sMiniContractsByAccountId
     
     - parameter accountId: (query) accountId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMiniContractsByAccountIdUsingGET(accountId: Int64, completion: @escaping ((_ data: [SMiniContract]?,_ error: Error?) -> Void)) {
        sMiniContractsByAccountIdUsingGETWithRequestBuilder(accountId: accountId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMiniContractsByAccountId
     - GET /sMiniContractsByAccountId
     - examples: [{output=none}]
     
     - parameter accountId: (query) accountId 

     - returns: RequestBuilder<[SMiniContract]> 
     */
    open class func sMiniContractsByAccountIdUsingGETWithRequestBuilder(accountId: Int64) -> RequestBuilder<[SMiniContract]> {
        let path = "/sMiniContractsByAccountId"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "accountId": accountId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[SMiniContract]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     update
     
     - parameter id: (path) id 
     - parameter sMiniContractDTO: (body) sMiniContractDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateUsingPOST2(id: Int64, sMiniContractDTO: SMiniContractDTO, completion: @escaping ((_ data: SMiniContract?,_ error: Error?) -> Void)) {
        updateUsingPOST2WithRequestBuilder(id: id, sMiniContractDTO: sMiniContractDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     update
     - POST /updateContract/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter sMiniContractDTO: (body) sMiniContractDTO 

     - returns: RequestBuilder<SMiniContract> 
     */
    open class func updateUsingPOST2WithRequestBuilder(id: Int64, sMiniContractDTO: SMiniContractDTO) -> RequestBuilder<SMiniContract> {
        var path = "/updateContract/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sMiniContractDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMiniContract>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
