//
//  EntranceViewController.swift
//  MusicCamera
//
//  Created by 程平 on 17/2/26.
//  Copyright © 2017年 程平. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController {

    
    @IBOutlet weak var segementControl: UISegmentedControl!
    
    var seletedIndex:Int = 0{
        didSet{
            segementControl.selectedSegmentIndex = seletedIndex
        }
    }
    
    var wifiController: WiFiStep1ViewController!
    
    var apController:APStep1ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createAndShowController(seletedIndex)
        print("EntranceViewController ===>viewDidLoad ")
        
        // 定义所有子页面返回按钮的名称
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }

    
    func createAndShowController(_ index:Int) {
        if index == 0 {
            if wifiController == nil{
               wifiController = WiFiStep1ViewController.swift_loadFromStoryboard("AddCamera", storyboardId: "WiFiStep1ViewController")
                wifiController.view.frame = self.view.bounds
                
            }
            if self.view.subviews.count == 2 {
                
            }
            print("createAndShowController ==0")
            self.addChildViewController(wifiController)
              self.view.addSubview(wifiController.view)
        }else if index == 1 {
            if apController == nil{
                  apController = APStep1ViewController.swift_loadFromStoryboard("AddCamera", storyboardId: "APStep1ViewController")
                 apController.view.frame = self.view.bounds
            }
           print("createAndShowController ==1")
            self.addChildViewController(apController)
            self.view.addSubview(apController.view)
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func selectedHandler(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        createAndShowController(index)
    }
    
    
    
}
