//
//  AddCameraViewController.swift
//  MusicCamera
//
//  Created by 程平 on 17/2/26.
//  Copyright © 2017年 程平. All rights reserved.
//

import UIKit

class AddCameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        // Do any additional setup after loading the view.
//        //设置中间视图
//        let segment = UISegmentedControl(items: ["已接来电","未接来 dian"])
//        segment.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
//        segment.selectedSegmentIndex = 1
//        //设置中间视图
//        navigationItem.titleView = segment
        // 定义所有子页面返回按钮的名称
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
