//
//  ObjectMapper+Extention.swift
//  Study
//
//  Created by 程平 on 16/11/30.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import ObjectMapper

class ResultResponse<T: Mappable>: Mappable {
    var result: T?
    var requestId: String?
    var success:Bool?
    var errorMgs:String?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        result <- map["data"]
       // requestId <- map["RequestID"]
        success <- map["Success"]
        errorMgs <- map["Message"]
    }
}
class ResultArrayResponse<T: Mappable>: Mappable {
    var result: [T]?
    var requestId: String?
    var success:Bool?
    var errorMgs:String?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        result <- map["data"]
        //requestId <- map["RequestID"]
        success <- map["Success"]
        errorMgs <- map["Message"]
    }
}

open class EmptyType: Mappable {
    
    required public init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        
    }
}
