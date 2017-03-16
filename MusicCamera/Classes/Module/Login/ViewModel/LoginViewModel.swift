//
//  LoginViewModel.swift
//  Starter
//
//  Created by 程平 on 16/8/31.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
//import Bond

class LoginViewModel {
    /*
    var account = Observable<String?>("")
    var pwd = Observable<String?>("")
    var submitEnable = Observable(false)
    
    var errorMgs = Observable<String?>(nil)
  
    init(){
       validationRegister()
    }
    
    func validationRegister()  {
        combineLatest(account, pwd).map { (ac, pd) -> Bool in
            return self.isAccountEmpty(ac!) && self.isPasswordEmpty(pd!)
        }.bindTo(submitEnable)
    }
    
    var user:User!
    func login(succeedClasback:()->Void)  {
        if validateBeforeLogin(account.value!){
            DaoEngine.sharedInstance.userDao.login(account.value!, pwd: pwd.value!) { (user, msg) in
                if msg == nil {
                    
                    self.user = user
                    succeedClasback()
                }else{
                    self.errorMgs.value = msg!.description
                }
            }
        }
        
        
      
    }
    // 内容空判断处理
    private func isPasswordEmpty(text:String) -> Bool{
        print("11")
        return text.characters.count>=6&&text.characters.count<=18
    }
    private func isAccountEmpty(text:String) ->Bool {
         print("00")
         return text.characters.count>=1&&text.characters.count<=11
    }
    
    // 更加精准的验证处理
    private func validateBeforeLogin(phone:String) ->Bool {
        let result = isPhoneNumber(phone)
        if !result{
             self.errorMgs.value = "手机号码不正确,请从新输入"
        }
        return result
    }
 */
}
