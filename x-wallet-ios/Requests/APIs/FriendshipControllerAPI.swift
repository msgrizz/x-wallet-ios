//
// FriendshipControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class FriendshipControllerAPI {
    /**
     addFriends
     
     - parameter addFriendDTO: (body) addFriendDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addFriendsUsingPOST(addFriendDTO: AddFriendDTO, completion: @escaping ((_ data: Bool?,_ error: Error?) -> Void)) {
        addFriendsUsingPOSTWithRequestBuilder(addFriendDTO: addFriendDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     addFriends
     - POST /addFriends
     - examples: [{output=none}]
     
     - parameter addFriendDTO: (body) addFriendDTO 

     - returns: RequestBuilder<Bool> 
     */
    open class func addFriendsUsingPOSTWithRequestBuilder(addFriendDTO: AddFriendDTO) -> RequestBuilder<Bool> {
        let path = "/addFriends"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: addFriendDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Bool>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     myFriends
     
     - parameter accountId: (query) accountId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func myFriendsUsingGET(accountId: Int64, completion: @escaping ((_ data: [SAccount]?,_ error: Error?) -> Void)) {
        myFriendsUsingGETWithRequestBuilder(accountId: accountId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     myFriends
     - GET /myFriends
     - examples: [{output=none}]
     
     - parameter accountId: (query) accountId 

     - returns: RequestBuilder<[SAccount]> 
     */
    open class func myFriendsUsingGETWithRequestBuilder(accountId: Int64) -> RequestBuilder<[SAccount]> {
        let path = "/myFriends"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "accountId": accountId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[SAccount]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
