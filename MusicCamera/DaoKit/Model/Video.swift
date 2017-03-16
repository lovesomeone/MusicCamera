//
//  Video.swift
//  Study
//
//  Created by 程平 on 16/12/24.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Video{
    var id:Int?
    var bookId:Int?
    var bookName:String?
    var firstTitleId:Int?
    var firstTitle:String?
    var secondTitleId:Int?
    var secondTitle:String?
    var firstModularId:Int?
    var firstModular:String?
    var secondModularId:Int?
    var secondModular:String?
    
    var videoTitle:String?
    var videoNumber:Int?
    var muteVideo:String?
    var completeVideo:String?
    var videoTime:String?
    var backgroundAudio:String?
    var videoCover:String?
    var videoDesc:String?
    var videoDifficulty:String?
    var createTime:String?
    var children:[SubVideo]?
    
}


extension Video: Mappable{
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
       id <- (map["ID"],anyToIntTransform)
       bookId <- (map["BookID"],anyToIntTransform)
       bookName <- map["BookName"]
       firstTitleId <- (map["FirstTitleID"],anyToIntTransform)
       firstTitle <- map["FirstTitle"]
       secondTitleId <- (map["SecondTitleID"],anyToIntTransform)
       secondTitle <- map["SecondTitle"]
       firstModularId <- (map["FirstModularID"],anyToIntTransform)
       firstModular <- map["FirstModular"]
       secondModularId <- (map["SecondModularID"],anyToIntTransform)
       secondModular <- map["SecondModular"]
       videoTitle <- map["VideoTitle"]
       videoNumber <- (map["VideoNumber"],anyToIntTransform)
       muteVideo <- map["MuteVideo"]
       completeVideo <- map["CompleteVideo"]
       videoTime <- map["VideoTime"]
       backgroundAudio <- map["BackgroundAudio"]
       videoCover <- map["VideoCover"]
       videoDesc <- map["VideoDesc"]
       videoDifficulty <- map["VideoDifficulty"]
       createTime <- map["CreateTime"]
       children <- map["children"]
    }
}



public struct SubVideo{
    var id:String?
   var videoId:String?
   var dialogueText:String?
   var dialogueNumber:String?
   var startTime:String?
   var endTime:String?
   var createTime:String?
}

extension SubVideo: Mappable{
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
       id <- map["ID"]
       videoId <- map["VideoID"]
       dialogueText <- map["DialogueText"]
       dialogueNumber <- map["DialogueNumber"]
       startTime <- map["StartTime"]
       endTime <- map["EndTime"]
       createTime <- map["CreateTime"]
    }
}




