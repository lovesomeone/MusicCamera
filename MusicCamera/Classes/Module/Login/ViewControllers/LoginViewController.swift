//
//  LoginViewController.swift
//  Starter
//
//  Created by 程平 on 16/8/31.
//  Copyright © 2016年 程平. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var accountLabel: UITextField!
    
    @IBOutlet weak var pwdLabel: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // bindViewModel()
        
        // 定义所有子页面返回按钮的名称
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        print("weixin=====>>\(WXApi.isWXAppInstalled())")
       
         print("qq=====>>\( QQApiInterface.isQQInstalled)")
        var flag =  QQApiInterface.isQQInstalled
//        if flag {
//            print("www.baidu.com")
//        }
    }
    
    
    
    @IBAction func testShare(_ sender: UIButton) {
        
        ShareSDK.getUserInfo(SSDKPlatformType.typeQQ) { (state, user, error) in
            
            
            
            print("==========\(error.debugDescription)")
            print("====state\(state)")
            print(user ?? "")
            print("uid=%@",user?.uid)
            print("%==@",user?.credential)
            print("token=%@",user?.credential.token)
            print("nickname=%@",user?.nickname)
        }
        
        
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        
        
        ShareSDK.cancelAuthorize(SSDKPlatformType.typeQQ)
        
    }
    
    
    
/*
    func bindViewModel() {
        viewModel.account.bidirectionalBindTo(accountLabel.bnd_text)
        viewModel.pwd.bidirectionalBindTo(pwdLabel.bnd_text)
        
        viewModel.submitEnable.bindTo(loginButton.bnd_enabled)
       
        viewModel.errorMgs.observe { (msg) in
            // Alert 提示信息的显示
            logger.warning("账号不对")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginHandler(sender: UIButton) {
        logger.info("loginHandler")
        viewModel.login { 
            // 登陆成功的跳转处理
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
*/
}
