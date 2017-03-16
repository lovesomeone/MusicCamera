//
//  Page.swift
//  Study
//
//  Created by 程平 on 16/12/18.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation

protocol PageConvertible {
    var  moduleIndex: Int{get set}
}


public struct Page :PageConvertible {
    var name:String = ""
    var localURL:URL!
    var imageURL:URL?
    
    var hots:[HotArea]?
    var moduleIndex: Int = -100
}

public struct MissingPage:PageConvertible{
    var moduleIndex: Int = -100
}

public struct HotArea{
    var id = ""
    var x = 0.0
    var y = 0.0
    var width = 0.0
    var height = 0.0
    var audioURL:URL?
    
}
