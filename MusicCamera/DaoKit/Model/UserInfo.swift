//
//  userInfo.swift
//  Race
//
//  Created by 程平 on 16/10/28.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation

import ObjectMapper

public struct UserInfo {
   var  appID: String?
   var  matchID: String?
   var  msgCount: Int?
   var  registerDate: String?
   var  userAddress: String?
   var  userEmail: String?
   var  userGrade: String?
   var  userID: String?
   var  userLocation: String?
   var  userLoginTime: String?
   var  userLoginTimes: Int?
   var  userName: String?

    
    var userImageURL:String?
    var userRole:Int?
    /**
     *  用户姓名
     */
    
    var  userNickname:String?
    var  userNum: String?
    var userPhone:String?
    var bookID:String?
    /**
     *  暂时不用
     */
    var  userRealname:String?
    
    var  userSchool:String?
    var  userStatus:Int?

}



extension UserInfo: Mappable{
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        /*
        appID <- map["AppID"]
        matchID <- map["MatchID"]
        msgCount <- map["MsgCount"]
        registerDate <- map["RegisterDate"]
        userAddress <- map["UserAddress"]
        userEmail <- map["UserEmail"]
        userGrade <- map["UserGrade"]
       
        userLocation <- map["UserLocation"]
        userLoginTime <- map["UserLoginTime"]
        userLoginTimes <- map["UserLoginTimes"]
        userName <- map["UserName"]
        
       
       
       
        
        userRealname <- map["UserRealname"]
        
        userSchool <- map["UserSchool"]
        userStatus <- map["UserStatus"]
        */
         userID <- map["UserID"]
         userNum <- map["UserNum"]
         userNickname <- map["Nickname"]
         userImageURL <- map["UserImage"]
        userRole <- map["UserRoles"]
        userRealname <- map["TrueName"]
         userPhone <- map["TelePhone"]
         bookID <- map["BookID"]
    }
}


/*
 "UserID": "66157255",
 "UserNum": "895538675",
 "NickName": "同步学Pw6795",
 "UserImage": "00000000-0000-0000-0000-000000000000",
 "UserRoles": 0,
 "TrueName": "",
 "TelePhone": "13175904697",
 "BookID": 0,
 "BookHistoryList": []
 */
