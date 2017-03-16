//
//  SetupNewPwdViewController.swift
//  Starter
//
//  Created by 程平 on 16/8/31.
//  Copyright © 2016年 程平. All rights reserved.
//

import UIKit

class SetupNewPwdViewController: UIViewController {

    
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var pwdConfirmTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    var viewModel = SetupNewPwdViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //bindView()
    }

    /*
    func bindView(){
        pwdTextField.bnd_text.bindTo(viewModel.pwd)
        pwdConfirmTextField.bnd_text.bindTo(viewModel.pwdConfirm)
        
        viewModel.submitEnable.bindTo(submitButton.bnd_enabled)
        viewModel.errorMgs.observe { (msg) in
            if msg != nil && msg! != ""{
                print("错误提示")
            }
        }
    }
    
    
    
    @IBAction func submitHandler(sender: UIButton) {
        viewModel.submitHandler { (succeed) in
            if succeed{
                print("submit succeed")
            }else{
                print("submit failed")
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
