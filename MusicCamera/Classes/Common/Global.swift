//
//  Global.swift
//  Study
//
//  Created by 程平 on 16/12/2.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation

open class Global{
    
    static let instance = Global()
    
    fileprivate init(){
        
    }
    
    //选中的课本
    //var selectedBook:Book?
    // 选中的目录
   // var selectedCatalogue:SeletedCatalogue?
}

// MARK：系统内部的消息类型

// 更新目录消息
let updateCatalogue = Notification.Name(rawValue: "UpdateCatalogueNotification")

let updateModuleList = Notification.Name(rawValue: "UpdateModuleListNotification")


// 解压完成

let unzipComplete = Notification.Name(rawValue: "fileAboutModuleUnzipComplete")


// 所有的声音播放结束了
let finishAllAudio = Notification.Name(rawValue: "finishAllAudio")

// 声音播放被打断了
let interruptAllAudio = Notification.Name(rawValue: "interruptAllAudio")

