//
// SMembershipControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SMembershipControllerAPI {
    /**
     add
     
     - parameter sMembershipDTO: (body) sMembershipDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addUsingPOST2(sMembershipDTO: SMembershipDTO, completion: @escaping ((_ data: SMembership?,_ error: Error?) -> Void)) {
        addUsingPOST2WithRequestBuilder(sMembershipDTO: sMembershipDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     add
     - POST /sMembership
     - examples: [{output=none}]
     
     - parameter sMembershipDTO: (body) sMembershipDTO 

     - returns: RequestBuilder<SMembership> 
     */
    open class func addUsingPOST2WithRequestBuilder(sMembershipDTO: SMembershipDTO) -> RequestBuilder<SMembership> {
        let path = "/sMembership"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sMembershipDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMembership>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     deleteSMembership
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteSMembershipUsingPOST(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        deleteSMembershipUsingPOSTWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     deleteSMembership
     - POST /deleteSMembership/{id}
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteSMembershipUsingPOSTWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/deleteSMembership/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     mySMemberships
     
     - parameter accountId: (query) accountId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func mySMembershipsUsingGET(accountId: Int64, completion: @escaping ((_ data: [String:[SMembership]]?,_ error: Error?) -> Void)) {
        mySMembershipsUsingGETWithRequestBuilder(accountId: accountId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     mySMemberships
     - GET /mySMemberships
     - examples: [{output=none}]
     
     - parameter accountId: (query) accountId 

     - returns: RequestBuilder<[String:[SMembership]]> 
     */
    open class func mySMembershipsUsingGETWithRequestBuilder(accountId: Int64) -> RequestBuilder<[String:[SMembership]]> {
        let path = "/mySMemberships"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "accountId": accountId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[String:[SMembership]]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     revokeSMembershipOwner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func revokeSMembershipOwnerUsingPOST(id: Int64, completion: @escaping ((_ error: Error?) -> Void)) {
        revokeSMembershipOwnerUsingPOSTWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     revokeSMembershipOwner
     - POST /revokeSMembershipOwner/{id}
     
     - parameter id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func revokeSMembershipOwnerUsingPOSTWithRequestBuilder(id: Int64) -> RequestBuilder<Void> {
        var path = "/revokeSMembershipOwner/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sMembershipOwner
     
     - parameter id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sMembershipOwnerUsingGET(id: Int64, completion: @escaping ((_ data: [SMembershipOwner]?,_ error: Error?) -> Void)) {
        sMembershipOwnerUsingGETWithRequestBuilder(id: id).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sMembershipOwner
     - GET /sMembershipOwners/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 

     - returns: RequestBuilder<[SMembershipOwner]> 
     */
    open class func sMembershipOwnerUsingGETWithRequestBuilder(id: Int64) -> RequestBuilder<[SMembershipOwner]> {
        var path = "/sMembershipOwners/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[SMembershipOwner]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     sendSMembership
     
     - parameter id: (path) id 
     - parameter sendSMembershipDTO: (body) sendSMembershipDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sendSMembershipUsingPOST(id: Int64, sendSMembershipDTO: SendSMembershipDTO, completion: @escaping ((_ data: Bool?,_ error: Error?) -> Void)) {
        sendSMembershipUsingPOSTWithRequestBuilder(id: id, sendSMembershipDTO: sendSMembershipDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     sendSMembership
     - POST /sendSMembership/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter sendSMembershipDTO: (body) sendSMembershipDTO 

     - returns: RequestBuilder<Bool> 
     */
    open class func sendSMembershipUsingPOSTWithRequestBuilder(id: Int64, sendSMembershipDTO: SendSMembershipDTO) -> RequestBuilder<Bool> {
        var path = "/sendSMembership/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sendSMembershipDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Bool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     update
     
     - parameter id: (path) id 
     - parameter sMembershipDTO: (body) sMembershipDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateUsingPOST1(id: Int64, sMembershipDTO: SMembershipDTO, completion: @escaping ((_ data: SMembership?,_ error: Error?) -> Void)) {
        updateUsingPOST1WithRequestBuilder(id: id, sMembershipDTO: sMembershipDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     update
     - POST /updateSMembership/{id}
     - examples: [{output=none}]
     
     - parameter id: (path) id 
     - parameter sMembershipDTO: (body) sMembershipDTO 

     - returns: RequestBuilder<SMembership> 
     */
    open class func updateUsingPOST1WithRequestBuilder(id: Int64, sMembershipDTO: SMembershipDTO) -> RequestBuilder<SMembership> {
        var path = "/updateSMembership/{id}"
        path = path.replacingOccurrences(of: "{id}", with: "\(id)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sMembershipDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMembership>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}