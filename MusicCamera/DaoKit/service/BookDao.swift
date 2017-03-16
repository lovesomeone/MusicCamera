//
//  BookDao.swift
//  Study
//
//  Created by 程平 on 16/12/1.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireObjectMapper


//public struct BookOptions{
//    var firstTitleID:Int
//    var secondTitleID:Int?
//    var bookID:Int
//    
//    init() {
//        firstTitleID = -1
//        secondTitleID = -1
//        bookID = -1
//    }
//}
public struct BookOptions{
    var firstTitleID:String
    var secondTitleID:String
    var bookID:String
    
    init() {
        firstTitleID = ""
        secondTitleID = ""
        bookID = ""
    }
}



protocol BookDao {
    
    func getBookListByAppId(_ id:String,completion:@escaping([Book]?,ErrorMessage?)->Void)
   
    func getAssetsByBookId(_ id:String,completion:@escaping([Module]?,ErrorMessage?)->Void)
    
    func getCatalogueListByBookId(_ id:String,completion:@escaping([Catalogue]?,ErrorMessage?)->Void)
    
    func getModules(_ bookOptions:BookOptions,completion:@escaping([Module]?,ErrorMessage?)->Void)
    
    func getEdtions(_ completion:@escaping([Edtion]?,ErrorMessage?)->Void)
}



class BookDaoImpl: BookDao {
    
    func getEdtions(_ completion: @escaping ([Edtion]?, ErrorMessage?) -> Void) {
       
        Alamofire.request(BookApi.GetEditionList.url).responseObject { (data:DataResponse<ResultArrayResponse<Edtion>>) in
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                completion((resultResponse?.result)!, nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion(nil, msg)
                
            }
        }
        
    }

    
    
    
    
    func getCatalogueListByBookId(_ id: String, completion: @escaping ([Catalogue]?, ErrorMessage?) -> Void) {
        let json:JSON = ["BookID":id]
        let param = ["Data":json.description]
        
        let urlParam = URLParamter(url: BookApi.GetCatalogueLists.url, parameters: param)
        
        networkHander(urlParam).responseObject { (data:DataResponse<ResultArrayResponse<Catalogue>>) in
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                completion((resultResponse?.result)!, nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion(nil, msg)
                
            }
            
        }
    }

    
    
    
    
   func getAssetsByBookId(_ id: String, completion: @escaping ([Module]?,ErrorMessage?) -> Void) {
        let json:JSON = ["BookID":id]
        let param = ["Data":json.description]
        
        let urlParam = URLParamter(url: BookApi.GetPointReadAssetsWithBookID.url, parameters: param)
        
        networkHander(urlParam).responseObject { (data:DataResponse<ResultArrayResponse<Module>>) in
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                 completion((resultResponse?.result)!, nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion(nil, msg)

            }
            
        }
    }

    
    
    func getBookListByAppId(_ id: String, completion: @escaping ([Book]?, ErrorMessage?) -> Void) {
        let json:JSON = ["AppID":id]
        let param = ["Data":json.description]
        
        let urlParam = URLParamter(url: BookApi.GetCourseList.url, parameters: param)

        networkHander(urlParam).responseObject { (data:DataResponse<ResultArrayResponse<Book>>) in
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                completion((resultResponse?.result)!, nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion(nil, msg)
            }

        }
    }

    
    
    func getModules(_ bookOptions: BookOptions, completion:@escaping ([Module]?, ErrorMessage?) -> Void) {
        let json:JSON = ["FirstTitleID":bookOptions.firstTitleID,"SecondTitleID":bookOptions.secondTitleID,"BookID":bookOptions.bookID]
        let param = ["Data":json.description]
        
        let urlParam = URLParamter(url: BookApi.GetModuleConfigurationByFirstIDSecondID.url, parameters: param)
        
        networkHander(urlParam).responseObject { (data:DataResponse<ResultArrayResponse<Module>>) in
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                completion((resultResponse?.result)!, nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion(nil, msg)
            }

        }
    }

    
    
    func networkHander(_ urlParamter:URLParamter)->DataRequest {
        
        return Alamofire.request(urlParamter.url, method: .post, parameters:urlParamter.parameters)
    }
}
