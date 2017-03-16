//
//  Edtion.swift
//  Study
//
//  Created by 程平 on 16/12/2.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 "EditionID": 1,
 "EditionName": "人教PEP版"
 */

public struct Edtion{
    var id:Int?
    var name:String?
}

extension Edtion : Mappable{
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        name <- map["EditionName"]
        id <- map["EditionID"]
    }
}
