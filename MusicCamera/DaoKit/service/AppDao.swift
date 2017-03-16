//
//  AppDao.swift
//  Study
//
//  Created by 程平 on 16/12/1.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

public struct AppOptions{
    var appId:String
    var type:String
    var versionNum:String
    
    init() {
        appId = ""
        type = ""
        versionNum = ""
    }
}

public protocol AppDao{
    func checkNewAppVersion(_ appOptions:AppOptions,completion:  (String?,ErrorMessage?)-> Void)
    
    
    
}


 class AppDaoImpl: AppDao{
    
    func checkNewAppVersion(_ appOptions: AppOptions, completion: (String?, ErrorMessage?) -> Void) {
        let json: JSON = ["AppId":appOptions.appId,"Type":appOptions.type,"VersionNumber":appOptions.versionNum]
        let param = ["Data": json.description]
        let urlParam = URLParamter(url: ApplicationVersionApi.GetNewVersions.url, parameters: param)
        
        networkHander(urlParam).responseObject { (data:DataResponse<ResultResponse<EmptyType>>) in
            
        }
        /*
         {
         "Success": true,
         "data": {
         "rows": [{
         "CreateDate": "\/Date(1479346378207)\/",
         "UserName": "yj002",
         "FileAddress": "",
         "FileMD5": "",
         "State": true,
         "MandatoryUpdate": false,
         "ID": 16,
         "VersionID": 21,
         "VersionType": 1,
         "VersionNumber": "V1.3.0",
         "VersionDescription": "您期待的“说说看”（跟读单词、跟读句子、跟读课文、跟读语音）上线啦！"
         }]
         },
         "Message": ""
         }
        */
        
    }

    func networkHander(_ urlParamter:URLParamter)->DataRequest {
        
        return Alamofire.request(urlParamter.url, method: .post, parameters:urlParamter.parameters)
    }
}
