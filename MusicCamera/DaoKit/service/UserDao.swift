//
//  UserDao.swift
//  Study
//
//  Created by 程平 on 16/11/29.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

public struct UserOption {
    /**
     *  机器码
     */
    var machineCode: String
    /**
     *  系统
     */
    var machineModel:String
    
    var userName:String
    var password:String
    var msgCode:String
    var userId:String
    var userNum:Int
    
    init() {
        machineCode = ""
        machineModel = ""
        userName = ""
        password = ""
        msgCode = ""
        userId = ""
        userNum = 0
        
    }
}

public struct URLParamter{
    var url:String
   // var method:String
    var parameters:Parameters
}


typealias UserDaoCallBack1 = (ErrorMessage?) -> Void
typealias UserDaoCallBack2 = (UserInfo?, ErrorMessage?) -> Void

public protocol UserDao {
    func login(_ userOption:UserOption,completion:@escaping (UserInfo?, ErrorMessage?) -> Void)
    
    func logout(_ userOption:UserOption,completion:@escaping (ErrorMessage?) -> Void)
    
    func register(_ userOption:UserOption,completion:@escaping (UserInfo?, ErrorMessage?) -> Void)
    
    func updateUser(_ userOption:UserOption,completion:@escaping (ErrorMessage?) -> Void)
    
    func changePassword(_ userOption:UserOption,completion:@escaping (ErrorMessage?) -> Void)
    
    func resetPassword(_ userOption:UserOption,completion:@escaping (ErrorMessage?) -> Void)
    
    func checkTelValidate(_ tel:String,completion:@escaping (ErrorMessage?)->Void)
    
    func sendMsgCode(_ tel:String, completion:@escaping (ErrorMessage?) -> Void)
    
    func validateMsgCode(_ tel:String,msgCode:String,completion:@escaping (ErrorMessage?)->Void)
    
   
}



class UserDaoImpl: UserDao{
    open func validateMsgCode(_ tel: String, msgCode: String, completion: @escaping (ErrorMessage?) -> Void) {
        let param:JSON = ["TelePhone":tel]
        let json = ["Data": param.description]
        
        let urlParam = URLParamter(url: UserApi.DecidePhoneCode.url,  parameters: json)
        networkHander(urlParam).responseObject{ (data: DataResponse<ResultResponse<EmptyType>>) in
            let resultResponse = data.result.value
            
            if let flag = resultResponse?.success , flag {
                 completion(nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion(msg)
            }
        }

    }

    open func sendMsgCode(_ tel: String, completion: @escaping (ErrorMessage?) -> Void) {
        let param:JSON = ["TelePhone":tel]
        let json = ["Data": param.description]
        
        let urlParam = URLParamter(url: UserApi.SendShortMessages.url,  parameters: json)
        
        networkHander(urlParam).responseObject{ (data: DataResponse<ResultResponse<EmptyType>>) in
            let resultResponse = data.result.value
            
            if let flag = resultResponse?.success , flag {
                 completion(nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion(msg)
            }
        }

    }

    open func checkTelValidate(_ tel: String, completion: @escaping (ErrorMessage?) -> Void) {
        let param:JSON = ["TelePhone":tel]
        let json = ["Data": param.description]
        
        let urlParam = URLParamter(url: UserApi.CheckPhone.url,  parameters: json)
        
        networkHander(urlParam).responseObject { (data: DataResponse<ResultResponse<EmptyType>>) in
            let resultResponse = data.result.value
            
            if let flag = resultResponse?.success , flag {
               completion(nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
               completion(msg)
            }
        }
    }

    open func resetPassword(_ userOption: UserOption, completion: @escaping (ErrorMessage?) -> Void) {
        
    }

    open func changePassword(_ userOption: UserOption, completion: @escaping (ErrorMessage?) -> Void) {
        
    }

    open func updateUser(_ userOption: UserOption, completion: @escaping (ErrorMessage?) -> Void) {
        
    }

    open func register(_ userOption: UserOption, completion: @escaping (UserInfo?, ErrorMessage?) -> Void) {
        
        let param:JSON = ["UserName":userOption.userName,"PassWord":userOption.password,"MessageCode":userOption.msgCode]
        let json = ["Data": param.description]
        let urlParam = URLParamter(url: UserApi.AppLogin.url,  parameters: json)
        
        networkHander(urlParam).responseObject { (data: DataResponse<ResultResponse<UserInfo>>) in

        }
        
        
        
    }
    open func logout(_ userOption: UserOption, completion: @escaping (ErrorMessage?) -> Void) {
        let param:JSON = ["UserID":userOption.userId,"UserNum":userOption.userNum,"MessageCode":userOption.msgCode]
        let json = ["Data": param.description]
         let urlParam = URLParamter(url: UserApi.AppLogin.url,  parameters: json)
        
         networkHander(urlParam).responseObject { (data: DataResponse<ResultResponse<EmptyType>>) in
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                completion( nil)
            }else{
                let s = resultResponse?.errorMgs ?? ""
                let msg = ErrorMessage(message: s)
                logger.warning("登陆出错了,程序员查看原因")
                completion( msg)
            }
        }
    }
    

    open func login(_ userOption: UserOption, completion:  @escaping (UserInfo?, ErrorMessage?) -> Void) {
        let param:JSON = ["UserName":userOption.userName,"PassWord":userOption.password]
        let json = ["Data": param.description]
        let urlParam = URLParamter(url: UserApi.AppLogin.url,  parameters: json)
        
        networkHander(urlParam).responseObject { (data: DataResponse<ResultResponse<UserInfo>>) in
           
            let resultResponse = data.result.value
            if let flag = resultResponse?.success , flag {
                 completion(resultResponse?.result, nil)
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

