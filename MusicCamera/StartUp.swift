//
//  StartUp.swift
//  StartV3.0
//
//  Created by 程平 on 16/10/26.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
//import XCGLogger

/*let logger: XCGLogger = {
 // Setup XCGLogger
 
 let log =  XCGLogger.default
 
 
 //    log.xcodeColorsEnabled = true // Or set the XcodeColors environment variable in your scheme to YES
 //    log.xcodeColors = [
 //        .Verbose: .lightGrey,
 //        .Debug: .whiteOnRed,
 //        .Info: .darkGreen,
 //        .Warning: .orange,
 //        .Error: XCGLogger.XcodeColor(fg: UIColor.redColor(), bg: UIColor.whiteColor()), // Optionally use a UIColor
 //        .Severe: XCGLogger.XcodeColor(fg: (255, 255, 255), bg: (255, 0, 0)) // Optionally use RGB values directly
 //    ]
 
 //    #if USE_NSLOG // Set via Build Settings, under Other Swift Flags
 //        log.removeLogDestination(XCGLogger.Constants.baseConsoleLogDestinationIdentifier)
 //        log.addLogDestination(XCGNSLogDestination(owner: log, identifier: XCGLogger.Constants.nslogDestinationIdentifier))
 //        log.logAppDetails()
 //    #else
 //        let logPath: NSURL = appDelegate.cacheDirectory.URLByAppendingPathComponent("XCGLogger_Log.txt")
 //        log.setup(.Debug, showThreadName: true, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: logPath)
 //    #endif
 
 return log
 }()
 */

/*
 #1AAF74 主题颜色
 */



var shareSDKApp = "1b9a863345f82"
var shareSDKKey = "bb253ed470cffb115aa46da352b95181"
var qqAppID = "1106008746"
var qqAppKey = "jQRDbHiPcO2zLEcZ"

class StartUp {
    
    
    
    
    static func setUp(){
        setApperance()
        
        //        let loc = FileManager.default.urls(for: <#T##FileManager.SearchPathDirectory#>, in: //)
        
        let home = NSHomeDirectory()
        print("home = \(home)")
        
        
        
    }
    
    static func setShareSdk(){
        ShareSDK.registerApp(shareSDKApp, activePlatforms:[
            
            SSDKPlatformType.typeQQ.rawValue],
                             onImport: { (platform : SSDKPlatformType) in
                                switch platform
                                {
                                    
                                    
                                case SSDKPlatformType.typeQQ:
                                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                                default:
                                    break
                                }
                                
        }) { (platform : SSDKPlatformType, appInfo : NSMutableDictionary?) in
            
            switch platform
            {
                
                
            case SSDKPlatformType.typeQQ:
                //设置QQ应用信息
                appInfo?.ssdkSetupQQ(byAppId: qqAppID,
                                     appKey : qqAppKey,
                                     authType : SSDKAuthTypeWeb)
            default:
                break
            }
            
        }

    }
    /*
    static func setShareSdk(){
        /**
         *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
         *  在将生成的AppKey传入到此方法中。
         *  方法中的第二个参数用于指定要使用哪些社交平台，以数组形式传入。第三个参数为需要连接社交平台SDK时触发，
         *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
         *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
         */
        
        ShareSDK.registerApp(shareSDKApp, activePlatforms:[
           
            SSDKPlatformType.typeTencentWeibo.rawValue,
            SSDKPlatformType.typeWechat.rawValue,
            SSDKPlatformType.typeQQ.rawValue],
                             onImport: { (platform : SSDKPlatformType) in
                                switch platform
                                {
                              
                                case SSDKPlatformType.typeWechat:
                                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                                case SSDKPlatformType.typeQQ:
                                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                                default:
                                    break
                                }
                                
        }) { (platform : SSDKPlatformType, appInfo : NSMutableDictionary?) in
            
            switch platform
            {
                
            case SSDKPlatformType.typeWechat:
                //设置微信应用信息
                appInfo?.ssdkSetupWeChat(byAppId: "wx4868b35061f87885", appSecret: "64020361b8ec4c99936c0e3999a9f249")
                
            case SSDKPlatformType.typeTencentWeibo:
                //设置腾讯微博应用信息，其中authType设置为只用Web形式授权
                appInfo?.ssdkSetupTencentWeibo(byAppKey: "801307650",
                                               appSecret : "ae36f4ee3946e1cbb98d6965b0b2ff5c",
                                               redirectUri : "http://www.sharesdk.cn")
            case SSDKPlatformType.typeQQ:
                //设置QQ应用信息
                appInfo?.ssdkSetupQQ(byAppId: qqAppID,
                                     appKey : qqAppKey,
                                     authType : SSDKAuthTypeWeb)
            default:
                break
            }
            
        }
    }
    */
    
    /*
     ShareSDK.getUserInfo(SSDKPlatformType.typeQQ) { (state, user, error) in
     
     
     //            if state.value == SSDKResponseStateSuccess.value {
     //
     //            }
     
     print("==========\(error.debugDescription)")
     print(state)
     }
     

 */
    static func setApperance(){
        
        
    }
}

