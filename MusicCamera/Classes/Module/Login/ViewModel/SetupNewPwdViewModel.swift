//
//  SetupNewPwdViewModel.swift
//  Starter
//
//  Created by 程平 on 16/9/2.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
//import Bond

class SetupNewPwdViewModel {
    /*
    var pwd = Observable<String?>("")
    var pwdConfirm = Observable<String?>("")
    
    var submitEnable = Observable(false)
    
    var errorMgs = Observable<String?>(nil)
    
    init(){
        combineLatest(pwd, pwdConfirm).map { (pwdTxt, pwdConfirmText) -> Bool in
            return validatePassword(pwdTxt!) && validatePassword(pwdConfirmText!)
        }.bindTo(submitEnable)
    }
    
    func submitHandler(callBack:(succeed:Bool)->Void){
        if validate() {
            DaoEngine.sharedInstance.userDao.changPassword("12345", pwd: pwd.value!, completion: { (error) in
               
                callBack(succeed: error == nil)
                self.errorMgs.value = error?.description
                
            })
        }else{
            self.errorMgs.value = "两次密码不一致"
        }
    }
    
    private func validate() -> Bool{
        return pwd.value == pwdConfirm.value
    }
    */
}
