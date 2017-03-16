//
//  VedioDao.swift
//  Study
//
//  Created by 程平 on 16/12/24.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireObjectMapper

public struct VideoOption{
    //option.FirstModularID = module.ModuleID;
    //option.FirstTitleID = module.FirstTitleID;
    //option.SecondTitleID = module.SecondTitleID;
    //option.BookID = module.BookID;
    var moduleID:Int = -1
    var firstTitleID:Int = -1
    var secondTitleID:Int = -1
    var bookID:Int = -1
    
}

public protocol VideoDao{
    func getVideoList(videoOption:VideoOption,completion: @escaping([Video]?,ErrorMessage?) -> Void)
    
    
}


public class VideoDaoImpl: VideoDao{
   

    public func getVideoList(videoOption: VideoOption, completion: @escaping ([Video]?,ErrorMessage?) -> Void) {
        let json :JSON = ["FirstModularID":videoOption.moduleID.description,"FirstTitleID":videoOption.firstTitleID.description,"SecondTitleID":videoOption.secondTitleID.description,"BookID":videoOption.bookID.description]
        
        let param = ["Data":json.description]
        let urlParm = URLParamter(url: VideoApi.GetVideoInforList.url, parameters: param)
        networkHander(urlParm).responseObject { (data:DataResponse<ResultArrayResponse<Video>>) in
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                completion((resultResponse?.result)!, nil)
                print("成功")
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
