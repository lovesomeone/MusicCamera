//
//  Catalogue.swift
//  Study
//
//  Created by 程平 on 16/12/1.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import ObjectMapper


public struct Catalogue{
    //var  id:String? //标题ID
    var  teachingNaterialName:String? //标题名称
    var  bookID:Int?//所属课程ID
    var  firstTitileID:Int?//书籍下面的模块ID
    var  firstTitle:String? //书籍下面的模块名字
    //var  createDate:String?
    
    var startingPage:Int?
    var endingPage:Int?
    
    var children:[SubCatalogue]?
}

//   <- map[""]
extension Catalogue: Mappable{
    
    public init?(map: Map) {
        
    }
    
    
    public mutating func mapping(map: Map) {
        // id <- map["ID"]
         teachingNaterialName <- map["TeachingNaterialName"]
         bookID <- map["BookID"]
         firstTitileID <- map["FirstTitileID"]
         firstTitle <- map["FirstTitle"]
        // createDate <- map["CreateDate"]
        startingPage <- map["StartingPage"]
        endingPage <- map["EndingPage"]
        children <- map["configlist"]
    }
    
}

public struct SubCatalogue{
    var  secondTitileID:Int?//书籍下面的模块ID
    var secondTitle:String? //书籍下面的模块名字
    var startingPage:Int?
    var endingPage:Int?
}
extension SubCatalogue: Mappable{
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        secondTitileID <- map["SecondTitleID"]
        secondTitle <- map["SecondTitle"]
        startingPage <- map["StartingPage"]
        endingPage <- map["EndingPage"]

    }
}
