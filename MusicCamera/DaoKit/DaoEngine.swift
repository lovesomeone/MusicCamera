//
//  DaoEngine.swift
//  Starter
//
//  Created by 程平 on 16/8/4.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation

class DaoEngine {
    
    
    lazy var userDao:UserDao = UserDaoImpl()
    lazy var bookDao:BookDao = BookDaoImpl()
    lazy var appDao:AppDao = AppDaoImpl()
    lazy var resourceDao:ResourceDao = ResourceDaoImpl()
    
    lazy var videoDao:VideoDao = VideoDaoImpl()
    
    static let sharedInstance = DaoEngine()
    fileprivate init() {
    }
    
    
}
