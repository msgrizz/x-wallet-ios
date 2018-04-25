//
//  AppDelegate.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/6.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import UserNotifications
import PushKit
import SwiftyJSON
import CoreData
import SugarRecord

let kGtAppId:String = "iMahVVxurw6BNr7XSn9EF2"
let kGtAppKey:String = "yIPfqwq6OMAPp6dkqgLpG5"
let kGtAppSecret:String = "G0aBqAD6t79JfzTB6Z5lo5"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GeTuiSdkDelegate, UNUserNotificationCenterDelegate, PKPushRegistryDelegate {

    var window: UIWindow?
    
    lazy var welcomeViewController: XWWelcomeViewController = {
        let welcome: UIStoryboard = UIStoryboard(name: "Welcome", bundle: nil)
        let controller = welcome.instantiateViewController(withIdentifier: "XWWelcomeViewController") as! XWWelcomeViewController
        return controller
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//         [ GTSdk ]：是否允许APP后台运行
        GeTuiSdk.runBackgroundEnable(true);
//         [ GTSdk ]：是否运行电子围栏Lbs功能和是否SDK主动请求用户定位
        GeTuiSdk.lbsLocationEnable(true, andUserVerify: true);
//         [ GTSdk ]：自定义渠道
        GeTuiSdk.setChannelId("APP-Store");
//         [ GTSdk ]：使用APPID/APPKEY/APPSECRENT启动个推
        GeTuiSdk.start(withAppId: kGtAppId, appKey: kGtAppKey, appSecret: kGtAppSecret, delegate: self);
//         注册APNs - custom method - 开发者自定义的方法
        self.registerRemoteNotification();
//         注册VOIP
//        self.voipRegistration();
        
        SHFullscreenPopGesture.configure()
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let version = Bundle.main.buildNumber
        let lastLaunchVersion = Defaults[.lastLaunchVersion]
        
        if version == lastLaunchVersion {
            let isLogin = Defaults[.isLogin]

            if isLogin {
                let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                window?.rootViewController = main.instantiateInitialViewController();
            }else {
                let login: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
                window?.rootViewController = login.instantiateInitialViewController();
            }
        }else {
            window?.rootViewController = welcomeViewController
            Defaults[.lastLaunchVersion] = version!
        }

        window!.makeKeyAndVisible()
        return true
    }
    
    /** 注册用户通知(推送) */
    func registerRemoteNotification() {
        /*
         警告：Xcode8的需要手动开启“TARGETS -> Capabilities -> Push Notifications”
         */
        
        /*
         警告：该方法需要开发者自定义，以下代码根据APP支持的iOS系统不同，代码可以对应修改。
         以下为演示代码，仅供参考，详细说明请参考苹果开发者文档，注意根据实际需要修改，注意测试支持的iOS系统都能获取到DeviceToken。
         */
        
        let systemVer = (UIDevice.current.systemVersion as NSString).floatValue;
        if systemVer >= 10.0 {
            if #available(iOS 10.0, *) {
                let center:UNUserNotificationCenter = UNUserNotificationCenter.current()
                center.delegate = self;
                center.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: { (granted:Bool, error:Error?) -> Void in
                    if (granted) {
                        print("注册通知成功") //点击允许
                    } else {
                        print("注册通知失败") //点击不允许
                    }
                })
                
                UIApplication.shared.registerForRemoteNotifications()
            } else {
            };
        }
    }
    
    
    // MARK: - 远程通知(推送)回调
    
    /** 远程通知注册成功委托 */
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceToken_ns = NSData.init(data: deviceToken);    // 转换成NSData类型
        var token = deviceToken_ns.description.trimmingCharacters(in: CharacterSet(charactersIn: "<>"));
        token = token.replacingOccurrences(of: " ", with: "")
        Defaults[.pushToken] = token
        // [ GTSdk ]：向个推服务器注册deviceToken
        GeTuiSdk.registerDeviceToken(token);
        NSLog("\n>>>[DeviceToken Success]:%@\n\n",token);
    }
    
    /** 远程通知注册失败委托 */
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("\n>>>[DeviceToken Error]:%@\n\n",error.localizedDescription);
    }
    
    // MARK: - APP运行中接收到通知(推送)处理 - iOS 10 以下
    
    /** APP已经接收到“远程”通知(推送) - (App运行在后台) */
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        application.applicationIconBadgeNumber = 0;        // 标签
        
        NSLog("\n>>>[Receive RemoteNotification]:%@\n\n",userInfo);
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        // [ GTSdk ]：将收到的APNs信息传给个推统计
        GeTuiSdk.handleRemoteNotification(userInfo);
        let json = userInfo["data"] as? String
        if let data = json?.data(using: .utf8) {
            let noti = try? JSONDecoder().decode(XWNotificationModel.self, from: data)
            if let nt = noti {
                self.processNotification(noti: nt)
            }
        }
        NSLog("\n>>>[Receive RemoteNotification]:%@\n\n",userInfo);
        completionHandler(UIBackgroundFetchResult.newData);
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("willPresentNotification: %@",notification.request.content.userInfo);
        
        completionHandler([.badge,.sound,.alert]);
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("didReceiveNotificationResponse: %@",response.notification.request.content.userInfo);
        
        // [ GTSdk ]：将收到的APNs信息传给个推统计
        GeTuiSdk.handleRemoteNotification(response.notification.request.content.userInfo);
        
        completionHandler();
    }
    
    // MARK: - VOIP 接入
    /**注册 VOIP */
    func voipRegistration() {
        let mainQueue = DispatchQueue.main;
        let voipRegistry: PKPushRegistry = PKPushRegistry(queue: mainQueue)
        voipRegistry.delegate = self
        voipRegistry.desiredPushTypes = [PKPushType.voIP]
    }
    
    // 实现 PKPushRegistryDelegate 协议方法
    /** 系统返回VOIPToken，并提交个推服务器 */
    func pushRegistry(_ registry: PKPushRegistry, didUpdate credentials: PKPushCredentials, for type: PKPushType) {
        let nsdataStr = NSData.init(data: credentials.token)
        let voiptoken = nsdataStr.description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        print(voiptoken)
        //向个推服务器注册 VoipToken
        GeTuiSdk.registerVoipToken(voiptoken);
    }
    
    /** 接收VOIP推送中的payload进行业务逻辑处理（一般在这里调起本地通知实现连续响铃、接收视频呼叫请求等操作），并执行个推VOIP回执统计 */
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType) {
        
        //个推VOIP回执统计
        GeTuiSdk.handleVoipNotification(payload.dictionaryPayload);
        //TODO:接受VOIP推送中的payload内容进行具体业务逻辑处理
        print("Voip Payload : %@, %@", payload, payload.dictionaryPayload);
    }
    
    // MARK: - GeTuiSdkDelegate
    
    /** SDK启动成功返回cid */
    func geTuiSdkDidRegisterClient(_ clientId: String!) {
        // [4-EXT-1]: 个推SDK已注册，返回clientId
        NSLog("\n>>>[GeTuiSdk RegisterClient]:%@\n\n", clientId);
    }
    
    /** SDK遇到错误回调 */
    func geTuiSdkDidOccurError(_ error: Error!) {
        // [EXT]:个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。
        NSLog("\n>>>[GeTuiSdk error]:%@\n\n", error.localizedDescription);
    }
    
    /** SDK收到sendMessage消息回调 */
    func geTuiSdkDidSendMessage(_ messageId: String!, result: Int32) {
        // [4-EXT]:发送上行消息结果反馈
        let msg:String = "sendmessage=\(messageId),result=\(result)";
        NSLog("\n>>>[GeTuiSdk DidSendMessage]:%@\n\n",msg);
    }
    
    func geTuiSdkDidReceivePayloadData(_ payloadData: Data!, andTaskId taskId: String!, andMsgId msgId: String!, andOffLine offLine: Bool, fromGtAppId appId: String!) {
        
        var payloadMsg = "";
        if((payloadData) != nil) {
            payloadMsg = String.init(data: payloadData, encoding: String.Encoding.utf8)!;
        }
        
        let msg:String = "Receive Payload: \(payloadMsg), taskId:\(taskId), messageId:\(msgId)";
        
        NSLog("\n>>>[GeTuiSdk DidReceivePayload]:%@\n\n",msg);
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if  Defaults[.isLogin] {
            XWMessageMannger.sharedInstance().suspendPulling()
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        application.applicationIconBadgeNumber = 0
        if  Defaults[.isLogin] {
            SAccountControllerAPI.getOneUsingGET(id: Int64(Defaults[.userId])) {  (account, error) in
                XWLocalManager.sharedInstance().localUser = account
            }
            let clear = ClearCountDTO(accountId: Int64(Defaults[.userId]))
            SAccountControllerAPI.clearCountUsingPOST(clearCountDTO: clear) { (error) in
                
            }
//            XWMessageMannger.sharedInstance().startPulling()
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func processNotification(noti: XWNotificationModel) {
        switch noti.type {
        case "MiniCoin":
            break
        case "":
            break
        default:
            break
        }
    }
    
    func coreDataStorage() -> CoreDataDefaultStorage {
        let store = CoreDataStore.named("LocalModel")
        let bundle = Bundle(for: self.classForCoder)
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    }
}

