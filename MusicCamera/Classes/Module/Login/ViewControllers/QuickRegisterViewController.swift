//
//  QuickRegisterViewController.swift
//  Starter
//
//  Created by 程平 on 16/8/31.
//  Copyright © 2016年 程平. All rights reserved.
//

import UIKit

class QuickRegisterViewController: UIViewController {

    
    @IBOutlet weak var accountLabel: UITextField!
    
    @IBOutlet weak var pwdLabel: UITextField!
    
    @IBOutlet weak var pwdConfirmLabel: UITextField!
    
    
    @IBOutlet weak var msgCodeLabel: UITextField!
    
    @IBOutlet weak var sendMsgCodeButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    var viewModel = QuickRegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //bindView()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        
    }
    
    
    /*
    func bindView(){
        accountLabel.bnd_text.bindTo(viewModel.account)
        pwdLabel.bnd_text.bindTo(viewModel.pwd)
        pwdConfirmLabel.bnd_text.bindTo(viewModel.pwdConfirm)
        
        msgCodeLabel.bnd_text.bindTo(viewModel.msgCode)
        
        viewModel.sendButtonEnable.bindTo(sendMsgCodeButton.bnd_enabled)
        viewModel.submitEnable.bindTo(submitButton.bnd_enabled)
        
        viewModel.errorMsg.observe { (msg) in
            if let s = msg{
                
            }else{
                
            }
        }
    }
    
    
    @IBAction func submitHandler(sender: UIButton) {
        viewModel.submitHandler { (succeed) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
