//
//  QuickRegisterViewModel.swift
//  Starter
//
//  Created by 程平 on 16/9/2.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
//import Bond

class QuickRegisterViewModel {
    
    /*
    var account = Observable<String?>("")
    var pwd = Observable<String?>("")
    var pwdConfirm = Observable<String?>("")
    var msgCode = Observable<String?>("")
    
    var sendButtonEnable = Observable<Bool>(false)
    var submitEnable = Observable(false)
    
    var errorMsg = Observable<String?>(nil)
    
    init(){
        account.observe { (tel) in
            self.validateAccount()
        }
        combineLatest(pwd, pwdConfirm, msgCode).map { (pwdTxt, pwdConfirmTxt, msgCodeTxt) -> Bool in
            return self.sendButtonEnable.value && validatePassword(pwdTxt!) && validatePassword(pwdConfirmTxt!) && (msgCodeTxt!.characters.count == 6)
        }.bindTo(submitEnable)
        
    }
    
    func submitHandler(callBack:(_ succeed:Bool)->Void){
        print("===>\(validate())")
        if validate() {
        
            DaoEngine.sharedInstance.userDao.register(self.account.value!, pwd: pwd.value!, msgCode: self.msgCode.value!, completion: { (userId, error) in
                callBack(succeed: error == nil)
                                self.errorMsg.value = error?.description
            })

        }else{
            self.errorMsg.value = "两次密码不一致"
        }
    }
    
    private func validate() -> Bool{
        return pwd.value == pwdConfirm.value
    }
  
    
    private func validateAccount(){
        // 本地验证数据是否符合手机号码规则，若符合，则继续进行服务器验证,
        let result = isPhoneNumber(self.account.value!)
        if result{
            DaoEngine.sharedInstance.userDao.checkTelValidate(self.account.value!, completion: { (error) in
                if let s = error?.description {
                    self.errorMsg.value = s
                    
                }else{
                    self.sendButtonEnable.value = true

                }
                
            })
        }
        
        
    }
 */

}
