//
//  AppDelegate.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/6.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var welcomeViewController: XWWelcomeViewController = {
        let welcome: UIStoryboard = UIStoryboard(name: "Welcome", bundle: nil)
        let controller = welcome.instantiateViewController(withIdentifier: "XWWelcomeViewController") as! XWWelcomeViewController
        return controller
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let version = Bundle.main.buildNumber
        let lastLaunchVersion = Defaults[.lastLaunchVersion]
        
        if version == lastLaunchVersion {
            let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            window?.rootViewController = main.instantiateInitialViewController();
        }else {
            window?.rootViewController = welcomeViewController
            Defaults[.lastLaunchVersion] = version!
        }
        
//        do {
//            try test()
//        } catch  {
//            
//        }

        window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func test() throws{
        let password = "testpass"
        let p = Profile(index: 0, nickName: "evrins", email: "evrins.hu@gmail.com", introduction: "hello world")
        let c = Contact(contactAddress: [1,2,3,4,5,6,7,8,9,10], contactProfile: p)
        let dataDirectory = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("datastore")
        let fsk = try FileSystemKeystore(dataDirectory:dataDirectory)
        var contacts = [Contact]()
        contacts.append(c)
        let isSucc = fsk.write(dataType: .Contact, password: password, data: contacts)
        if (isSucc) {
            print("success")
        } else {
            print("failed")
        }
        print("hello world")
        print(fsk.fileMap)
        let c2: [Contact] = fsk.read(dataType: .Contact, password: password)
        print(c2)
    }

}

