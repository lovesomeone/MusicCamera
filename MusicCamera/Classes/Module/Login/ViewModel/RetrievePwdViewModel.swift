//
//  RetrievePwdViewModel.swift
//  Starter
//
//  Created by 程平 on 16/9/1.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
//import Bond

class RetrievePwdViewModel {
    /*
    var account = Observable<String?>("")
    var msgCode = Observable<String?>("")
    
      var errorMsg = Observable<String?>("")
    var accountAreadyExist = Observable<Bool>(false)
    
    var sendButtonEnable = Observable<Bool>(false)
    var nextStepButtonEnable = Observable<Bool>(false)
    
    init(){

        account.observe { _ in
            self.validateAccount()
        }
     
        msgCode.map {
            return $0!.characters.count == 6 && self.sendButtonEnable.value
        }.bindTo(nextStepButtonEnable)

    }
    
    
    func sendMsgCode(callBack:(succeed:Bool)->Void)  {
        print("sendMsgCode")
         DaoEngine.sharedInstance.userDao.sendMsgCode("", tel: account.value!) { (error) in
                
                if error != nil {
                    self.errorMsg.value = error?.description
                }
                callBack(succeed: (error == nil))
        }
        
       
    }
    
    func validateForm(callBack:(succeed:Bool)->Void) {
        nextStepButtonEnable.value = false
        DaoEngine.sharedInstance.userDao.validateMsgCode(self.account.value!, msgCode: self.msgCode.value!) { (error) in
            
            self.nextStepButtonEnable.value = true
            if error != nil {
                self.errorMsg.value = error?.description
            }
            callBack(succeed: (error == nil))
        }
        
    }
    
   private func validateAccount(){
        // 本地验证数据是否符合手机号码规则，若符合，则继续进行服务器验证,
        let result = isPhoneNumber(self.account.value!)
        if result{
            DaoEngine.sharedInstance.userDao.checkTelValidate(self.account.value!, completion: { (error) in
                if let s = error?.description where s != "网络连接失败"{
                    self.sendButtonEnable.value = true
                    
                }else{
                    self.errorMsg.value = error?.description ?? "手机未注册"
                }

            })
        }
       
        
    }
    
//    private func validateMsgCode(msgCode:String) -> Bool{
//        let result = (msgCode.characters.count == 6)
//        if !result{
//            self.errorMsg.value = "验证码位数不对"
//        }
//        return result
//    }
    
  */
}
