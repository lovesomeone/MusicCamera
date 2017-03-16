//
//  RetrievePwdViewController.swift
//  Starter
//
//  Created by 程平 on 16/8/31.
//  Copyright © 2016年 程平. All rights reserved.
//

import UIKit

class RetrievePwdViewController: UIViewController {

    
    @IBOutlet weak var accountLabel: UITextField!
    
    @IBOutlet weak var msgCodeLabel: UITextField!
    
    @IBOutlet weak var getMsgCodeButton: UIButton!
    
    @IBOutlet weak var nextStepButton: UIButton!
    
    var viewMode = RetrievePwdViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //accountLabel.delegate = self
      
        // bindViewModel()
    }
    /*
    func bindViewModel() {
        viewMode.sendButtonEnable.bindTo(getMsgCodeButton.bnd_enabled)
        viewMode.nextStepButtonEnable.bindTo(nextStepButton.bnd_enabled)
        
        accountLabel.bnd_text.bindTo(viewMode.account)
        msgCodeLabel.bnd_text.bindTo(viewMode.msgCode)
        
        viewMode.errorMsg.observe { (msg) in
            if msg != nil {
                print("show alert \(msg!)")
            }
        }
    }
    
    
    @IBAction func sendMsgCodeHandler(sender: UIButton) {
        viewMode.sendMsgCode { (succeed) in
            if succeed{
                print("send succeed")
            }else{
                  print("send failed")
            }
        }
        print("out click handler")
    }
    
    @IBAction func nextStepHandler(sender: UIButton) {
        viewMode.validateForm { (succeed) in
            if succeed{
                print("validateForm succeed")
                self.performSegueWithIdentifier("gotoSetNewPwd", sender: nil)
            }else{
                print("validateForm failed")
            }
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

//extension RetrievePwdViewController: UITextFieldDelegate{
//    func textFieldDidEndEditing(textField: UITextField) {
//       print("textFieldDidEndEditing")
//        //viewMode.validateAccount()
//    }
//}
