//
// SChatControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SChatControllerAPI {
    /**
     pull
     
     - parameter conversationId: (query) conversationId 
     - parameter lastMsgId: (query) lastMsgId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func pullUsingGET(conversationId: Int64, lastMsgId: Int64, completion: @escaping ((_ data: [SMessage]?,_ error: Error?) -> Void)) {
        pullUsingGETWithRequestBuilder(conversationId: conversationId, lastMsgId: lastMsgId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     pull
     - GET /messages
     - examples: [{output=none}]
     
     - parameter conversationId: (query) conversationId 
     - parameter lastMsgId: (query) lastMsgId 

     - returns: RequestBuilder<[SMessage]> 
     */
    open class func pullUsingGETWithRequestBuilder(conversationId: Int64, lastMsgId: Int64) -> RequestBuilder<[SMessage]> {
        let path = "/messages"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "conversationId": conversationId.encodeToJSON(), 
            "lastMsgId": lastMsgId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[SMessage]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     push
     
     - parameter sMessageDTO: (body) sMessageDTO 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func pushUsingPOST(sMessageDTO: SMessageDTO, completion: @escaping ((_ data: SMessage?,_ error: Error?) -> Void)) {
        pushUsingPOSTWithRequestBuilder(sMessageDTO: sMessageDTO).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     push
     - POST /messages
     - examples: [{output=none}]
     
     - parameter sMessageDTO: (body) sMessageDTO 

     - returns: RequestBuilder<SMessage> 
     */
    open class func pushUsingPOSTWithRequestBuilder(sMessageDTO: SMessageDTO) -> RequestBuilder<SMessage> {
        let path = "/messages"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sMessageDTO)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SMessage>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
