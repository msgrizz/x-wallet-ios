//
// SAccountControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SAccountControllerAPI {
    /**
     clearCount
     
     - parameter clearCountDTO: (body) clearCountDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func clearCountUsingPOST(clearCountDTO: ClearCountDTO, completion: @escaping ((_ error: Error?) -> Void)) {
        clearCountUsingPOSTWithRequestBuilder(clearCountDTO: clearCountDTO).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     clearCount
     - POST /clearCount
     
     - parameter clearCountDTO: (body) clearCountDTO 

     - returns: RequestBuilder<Void> 
     */
    open class func clearCountUsingPOSTWithRequestBuilder(clearCountDTO: ClearCountDTO) -> RequestBuilder<Void> {
        let path = "/clearCount"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: clearCountDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     getAllExceptMe
     
     - parameter id: (query) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAllExceptMeUsingGET(id: Int64, completion: @escaping ((_ data: [SAccount]?,_ error: Error?) -> Void)) {
        getAllExceptMeUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     getAllExceptMe
     - GET /sAccountsExceptMe
     - examples: [{output=none}]
     
     - parameter id: (query) id 

     - returns: RequestBuilder<[SAccount]> 
     */
    open class func getAllExceptMeUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<[SAccount]> {
        let path = "/sAccountsExceptMe"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "id": id.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[SAccount]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     getOne
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getOneUsingGET(id: Int64, completion: @escaping ((_ data: SAccount?,_ error: Error?) -> Void)) {
        getOneUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     getOne
     - GET /sAccounts/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<SAccount> 
     */
    open class func getOneUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<SAccount> {
        var path = "/sAccounts/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     get
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getUsingGET(completion: @escaping ((_ data: [SAccount]?,_ error: Error?) -> Void)) {
        getUsingGETWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     get
     - GET /sAccounts
     - examples: [{output=none}]

     - returns: RequestBuilder<[SAccount]> 
     */
    open class func getUsingGETWithRequestBuilder() -> RequestBuilder<[SAccount]> {
        let path = "/sAccounts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[SAccount]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     post
     
     - parameter sAccountDTO: (body) sAccountDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postUsingPOST(sAccountDTO: SAccountDTO, completion: @escaping ((_ data: SAccount?,_ error: Error?) -> Void)) {
        postUsingPOSTWithRequestBuilder(sAccountDTO: sAccountDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     post
     - POST /sAccounts
     - examples: [{output=none}]
     
     - parameter sAccountDTO: (body) sAccountDTO 

     - returns: RequestBuilder<SAccount> 
     */
    open class func postUsingPOSTWithRequestBuilder(sAccountDTO: SAccountDTO) -> RequestBuilder<SAccount> {
        let path = "/sAccounts"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sAccountDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     put
     
     - parameter sAccountDTO: (body) sAccountDTO 
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func putUsingPUT(sAccountDTO: SAccountDTO, id: Int64, completion: @escaping ((_ data: SAccount?,_ error: Error?) -> Void)) {
        putUsingPUTWithRequestBuilder(sAccountDTO: sAccountDTO, id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     put
     - PUT /sAccounts/{id}
     - examples: [{output=none}]
     
     - parameter sAccountDTO: (body) sAccountDTO 
     - parameter id: (path) id 

     - returns: RequestBuilder<SAccount> 
     */
    open class func putUsingPUTWithRequestBuilder(sAccountDTO: SAccountDTO, id: Int64) -> RequestBuilder<SAccount> {
        var path = "/sAccounts/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sAccountDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     registerPushToken
     
     - parameter sPushTokenDTO: (body) sPushTokenDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func registerPushTokenUsingPOST(sPushTokenDTO: SPushTokenDTO, completion: @escaping ((_ data: Bool?,_ error: Error?) -> Void)) {
        registerPushTokenUsingPOSTWithRequestBuilder(sPushTokenDTO: sPushTokenDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     registerPushToken
     - POST /registerPushToken
     - examples: [{output=none}]
     
     - parameter sPushTokenDTO: (body) sPushTokenDTO 

     - returns: RequestBuilder<Bool> 
     */
    open class func registerPushTokenUsingPOSTWithRequestBuilder(sPushTokenDTO: SPushTokenDTO) -> RequestBuilder<Bool> {
        let path = "/registerPushToken"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sPushTokenDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Bool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     signIn
     
     - parameter signInDTO: (body) signInDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func signInUsingPOST(signInDTO: SignInDTO, completion: @escaping ((_ data: ResponseSAccount?,_ error: Error?) -> Void)) {
        signInUsingPOSTWithRequestBuilder(signInDTO: signInDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     signIn
     - POST /signIn
     - examples: [{output=none}]
     
     - parameter signInDTO: (body) signInDTO 

     - returns: RequestBuilder<ResponseSAccount> 
     */
    open class func signInUsingPOSTWithRequestBuilder(signInDTO: SignInDTO) -> RequestBuilder<ResponseSAccount> {
        let path = "/signIn"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: signInDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ResponseSAccount>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     unregisterPushToken
     
     - parameter sPushTokenDTO: (body) sPushTokenDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func unregisterPushTokenUsingPOST(sPushTokenDTO: SPushTokenDTO, completion: @escaping ((_ data: Bool?,_ error: Error?) -> Void)) {
        unregisterPushTokenUsingPOSTWithRequestBuilder(sPushTokenDTO: sPushTokenDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     unregisterPushToken
     - POST /unregisterPushToken
     - examples: [{output=none}]
     
     - parameter sPushTokenDTO: (body) sPushTokenDTO 

     - returns: RequestBuilder<Bool> 
     */
    open class func unregisterPushTokenUsingPOSTWithRequestBuilder(sPushTokenDTO: SPushTokenDTO) -> RequestBuilder<Bool> {
        let path = "/unregisterPushToken"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sPushTokenDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Bool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
