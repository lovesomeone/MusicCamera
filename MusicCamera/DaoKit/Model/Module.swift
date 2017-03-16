//
//  Module.swift
//  Study
//
//  Created by 程平 on 16/12/1.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 // 资源其他信息
 @property (copy, nonatomic) NSString *ID; //表中的编号
 @property (copy, nonatomic) NSString *TeachingNaterialName;
 @property (copy, nonatomic) NSString *IsUpdate; //是否是最新版本
 @property (copy, nonatomic) NSString *UpdateDescription;//资源更新信息
 @property (copy, nonatomic) NSString *State; //状态
 @property (copy, nonatomic) NSString *CreateDate;
 @property (copy, nonatomic) NSString *IsActive;
 
 */

public struct Module{
    var   moduleID:Int?  //模块ID
    var   moduleName:String? //模块名称
    var   firstTitleID:Int? //书籍下面的模块ID
    var   firstTitle:String? //书籍下面的模块ID
    var   secondTitleID:Int? //书籍下面的模块ID
    var   secondTitle:String? //书籍下面的模块ID
    var   moduleAddress:String? //下载地址
    var   md5:String?
    var   incrementalPacketAddress:String? //增量包下载地址
    var   incrementalPacketMD5:String? //Md5
    var   moduleVersion:String? //最新版本
    var   bookID:Int?
    var   id:Int? //表中的编号
    
    var   updateDescription:String?
    var   state:Bool?
    var   isUpdate:Bool?
    var   createDate:String?
    var   teachingNaterialName:String?
    
    var   moduleSort:String?
    var   versionSort:String?
    var   superiorID:String? //所属标题ID
    
    var listVersionChangeModuleSort:[Module]?
    
    
}


//   <- map[""]
// 因为后台有一个接口把id做成了string类型，故此处做额外的判断转换
extension Module: Mappable{
    public init?(map: Map) {
     
    }
    
    public mutating func mapping(map: Map) {
        moduleID <- (map["ModuleID"],anyToIntTransform)
        moduleName <- map["ModuleName"]
       
        
        firstTitleID <- (map["FirstTitleID"],anyToIntTransform)
        firstTitle <- map["FirstTitle"]
        secondTitleID <- (map["SecondTitleID"],anyToIntTransform)
        secondTitle <- map["SecondTitle"]
        moduleAddress <- map["ModuleAddress"]
        md5 <- map["MD5"]
        incrementalPacketAddress <- map["IncrementalPacketAddress"]
        incrementalPacketMD5 <- map["IncrementalPacketMD5"]
        moduleVersion <- map["ModuleVersion"]
        // 后台字段 在两个接口返回数据中的属性不一样，数据库设计时应该避免
       
        bookID <- (map["BookID"],anyToIntTransform)
        
        if bookID == nil{
            bookID <- (map["BooKID"],anyToIntTransform)
        }
        
        updateDescription <- map["UpdateDescription"]
        state <- map["State"]
        isUpdate <- map["IsUpdate"]
        createDate <- map["CreateDate"]
        id <- (map["ID"],anyToIntTransform)
        teachingNaterialName <- map["TeachingNaterialName"]
        
         superiorID <- map["SuperiorID"]
        moduleSort <- map["ModuleSort"]
        versionSort <- map["VersionSort"]
        
        listVersionChangeModuleSort <- map["listVersionChangeModuleSort"]
    }
}

let anyToIntTransform = TransformOf<Int,Any>.init(fromJSON: { (value) -> Int? in
    if let i = value as? Int{
        return i
    }else if let i = value as? String {
        return Int(i)
    }else{
        return -1
    }
}) { (value) -> Any? in
    return value
}

