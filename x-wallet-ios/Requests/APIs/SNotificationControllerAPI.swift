//
// SNotificationControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SNotificationControllerAPI {
    /**
     pull
     
     - parameter lastQueryTime: (query) lastQueryTime 
     - parameter receiverId: (query) receiverId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func pullUsingGET(lastQueryTime: Int64, receiverId: Int64, completion: @escaping ((_ data: [SNotification]?,_ error: Error?) -> Void)) {
        pullUsingGETWithRequestBuilder(lastQueryTime: lastQueryTime, receiverId: receiverId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     pull
     - GET /notifications
     - examples: [{output=none}]
     
     - parameter lastQueryTime: (query) lastQueryTime 
     - parameter receiverId: (query) receiverId 

     - returns: RequestBuilder<[SNotification]> 
     */
    open class func pullUsingGETWithRequestBuilder(lastQueryTime: Int64, receiverId: Int64) -> RequestBuilder<[SNotification]> {
        let path = "/notifications"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "lastQueryTime": lastQueryTime.encodeToJSON(), 
            "receiverId": receiverId.encodeToJSON()
        ])
        

        let requestBuilder: RequestBuilder<[SNotification]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     push
     
     - parameter n: (body) n 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func pushUsingPOST(n: SNotificationDTO, completion: @escaping ((_ data: SNotification?,_ error: Error?) -> Void)) {
        pushUsingPOSTWithRequestBuilder(n: n).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     push
     - POST /notifications
     - examples: [{output=none}]
     
     - parameter n: (body) n 

     - returns: RequestBuilder<SNotification> 
     */
    open class func pushUsingPOSTWithRequestBuilder(n: SNotificationDTO) -> RequestBuilder<SNotification> {
        let path = "/notifications"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: n)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<SNotification>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}