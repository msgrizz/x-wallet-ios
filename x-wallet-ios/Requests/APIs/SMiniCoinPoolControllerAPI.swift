//
// SMiniCoinPoolControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SMiniCoinPoolControllerAPI {
    /**
     add
     
     - parameter m: (body) m 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addUsingPOST3(m: SMiniCoinPoolDTO, completion: @escaping ((_ data: SMiniCoinPool?,_ error: Error?) -> Void)) {
        addUsingPOST3WithRequestBuilder(m: m).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     add
     - POST /miniCoinPools
     - examples: [{output=none}]
     
     - parameter m: (body) m 

     - returns: RequestBuilder<SMiniCoinPool> 
     */
    open class func addUsingPOST3WithRequestBuilder(m: SMiniCoinPoolDTO) -> RequestBuilder<SMiniCoinPool> {
        let path = "/miniCoinPools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: m)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     dashboard
     
     - parameter personId: (query) personId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func dashboardUsingGET1(personId: Int64, completion: @escaping ((_ data: [String:[MiniCoinPoolDashBoardDTO]]?,_ error: Error?) -> Void)) {
        dashboardUsingGET1WithRequestBuilder(personId: personId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     dashboard
     - GET /miniCoinPoolDashBoard
     - examples: [{output=none}]
     
     - parameter personId: (query) personId 

     - returns: RequestBuilder<[String:[MiniCoinPoolDashBoardDTO]]> 
     */
    open class func dashboardUsingGET1WithRequestBuilder(personId: Int64) -> RequestBuilder<[String:[MiniCoinPoolDashBoardDTO]]> {
        let path = "/miniCoinPoolDashBoard"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "personId": personId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[String:[MiniCoinPoolDashBoardDTO]]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     getOne
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getOneUsingGET2(id: Int64, completion: @escaping ((_ data: SMiniCoinPool?,_ error: Error?) -> Void)) {
        getOneUsingGET2WithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     getOne
     - GET /miniCoinPools/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<SMiniCoinPool> 
     */
    open class func getOneUsingGET2WithRequestBuilder(id: Int64) -> RequestBuilder<SMiniCoinPool> {
        var path = "/miniCoinPools/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     getOneWithAccountId
     
     - parameter poolId: (query) poolId 
     - parameter accountId: (query) accountId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getOneWithAccountIdUsingGET(poolId: Int64, accountId: Int64, completion: @escaping ((_ data: SMiniCoinPool?,_ error: Error?) -> Void)) {
        getOneWithAccountIdUsingGETWithRequestBuilder(poolId: poolId, accountId: accountId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     getOneWithAccountId
     - GET /miniCoinPoolsWithAccountId
     - examples: [{output=none}]
     
     - parameter poolId: (query) poolId 
     - parameter accountId: (query) accountId 

     - returns: RequestBuilder<SMiniCoinPool> 
     */
    open class func getOneWithAccountIdUsingGETWithRequestBuilder(poolId: Int64, accountId: Int64) -> RequestBuilder<SMiniCoinPool> {
        let path = "/miniCoinPoolsWithAccountId"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "poolId": poolId.encodeToJSON(), 
            "accountId": accountId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<SMiniCoinPool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     get
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getUsingGET1(completion: @escaping ((_ data: [SMiniCoinPool]?,_ error: Error?) -> Void)) {
        getUsingGET1WithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     get
     - GET /miniCoinPools
     - examples: [{output=none}]

     - returns: RequestBuilder<[SMiniCoinPool]> 
     */
    open class func getUsingGET1WithRequestBuilder() -> RequestBuilder<[SMiniCoinPool]> {
        let path = "/miniCoinPools"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[SMiniCoinPool]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     toggle
     
     - parameter accountId: (query) accountId 
     - parameter miniCoinPoolId: (query) miniCoinPoolId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func toggleUsingPOST(accountId: Int64, miniCoinPoolId: Int64, completion: @escaping ((_ data: Bool?,_ error: Error?) -> Void)) {
        toggleUsingPOSTWithRequestBuilder(accountId: accountId, miniCoinPoolId: miniCoinPoolId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     toggle
     - POST /toggleImportant
     - examples: [{output=none}]
     
     - parameter accountId: (query) accountId 
     - parameter miniCoinPoolId: (query) miniCoinPoolId 

     - returns: RequestBuilder<Bool> 
     */
    open class func toggleUsingPOSTWithRequestBuilder(accountId: Int64, miniCoinPoolId: Int64) -> RequestBuilder<Bool> {
        let path = "/toggleImportant"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "accountId": accountId.encodeToJSON(), 
            "miniCoinPoolId": miniCoinPoolId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<Bool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
