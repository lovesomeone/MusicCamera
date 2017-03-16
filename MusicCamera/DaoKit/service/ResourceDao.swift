//
//  ResourceDao.swift
//  Study
//
//  Created by 程平 on 16/12/18.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import AEXML

public protocol ResourceDao {
    func getPages(withFileURL:URL,withModulIndex:Int) -> [Page]
}


public class ResourceDaoImpl: ResourceDao{
    
    public func getPages(withFileURL: URL,withModulIndex:Int) -> [Page] {
        var result = [Page]()
        
        // 获取文件夹里面的文件列表,遍历文件，
        // 当其前缀包含‘page’文字是，解析里面的数据，生成Page对象，
        // 并添加到结果列表里
        let fileList = try?  FileManager.default.contentsOfDirectory(atPath: withFileURL.path)
        print("fileList =\(fileList)")
        if let files = fileList{
            for file in files {
                if file.hasPrefix("page"){
                    let fileURL = withFileURL.appendingPathComponent(file)
                   // print("filePath==\(filePath)")
                    let imagePath = getBackgroundImagePath(fileURL: fileURL)
                    let hots = getHotAreas(fileURL: fileURL)
                    
                    var page = Page()
                    page.name = file
                    page.localURL = fileURL
                    page.imageURL = imagePath
                    page.hots = hots
                    page.moduleIndex = withModulIndex
                    result.append(page)
                }
            }
        }
        
        return result
    }
    
    
    private func getBackgroundImagePath(fileURL:URL) ->URL?{
        let imageURL = fileURL.appendingPathComponent("bg.jpg")
        if FileManager.default.fileExists(atPath: imageURL.path){
            return imageURL
        }
        return nil
    }
    
    private func getHotAreas(fileURL:URL) ->[HotArea]?{
        let configeURL = fileURL.appendingPathComponent("DialogButtonConfig.xml")
       //  print("configPath==\(configPath)")
        guard   let data = try? Data(contentsOf: configeURL) else {
            return nil
        }
        let parentURL = fileURL.deletingLastPathComponent()
        var result = [HotArea]()
        let  xmlResult = try? AEXMLDocument(xml: data)
        if let  xmlDoc = xmlResult {
            for child in xmlDoc.root.children {
                result.append(parserXmlToObject(xml: child,parentURL:parentURL))
            }
        }
        return result
        
    }
    
    
    private   func parserXmlToObject(xml: AEXMLElement,parentURL:URL) -> HotArea {
        var result = HotArea()
        
        result.id = xml.attributes["id"]!
        result.x = xml["x"].double
        result.y = xml["y"].double
        result.width = xml["width"].double
        result.height = xml["height"].double
        result.audioURL = parentURL.appendingPathComponent(xml["soundpath"].string)
        
        // result.link = xml["link"].intValue
        // result.text = xml["text"].stringValue
        // print("xml ======>>> \(result.text) ||  \(result.soundPath)")
        return  result
    }
}
