//
//  ErrorMessage.swift
//  Starter
//
//  Created by 程平 on 16/8/6.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation

/**
   传递错误提示消息的对象，此类消息主要呈现给用户
 */
open class ErrorMessage: NSObject {

    var message = ""
   
    
    open override var description: String{
        return message
    }
    
    init(message:String) {
        self.message = message
    }
    
    
}
