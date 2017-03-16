//
//  CameraSeletedViewController.swift
//  MusicCamera
//
//  Created by 程平 on 17/2/25.
//  Copyright © 2017年 程平. All rights reserved.
//

import UIKit

class CameraSeletedViewController: UIViewController {

    var deviceTitle:String = ""
    
    fileprivate var images = ["","",""]
    fileprivate var names = ["监控","音乐","主机"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 定义所有子页面返回按钮的名称
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
         self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "staitcCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.tableFooterView = UIView()
       
        
        self.automaticallyAdjustsScrollViewInsets = false
        
      
        self.navigationItem.title = deviceTitle
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



extension CameraSeletedViewController :  UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "staitcCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.text = names[indexPath.section]
        
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
}



extension CameraSeletedViewController :  UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            self.performSegue(withIdentifier: "showConnectedDevices", sender: nil)
        } else if indexPath.section == 1 {
            let music = MusicMainViewController.swift_loadFromStoryboard("Music", storyboardId: "MusicMainViewController")
            
            self.navigationController?.pushViewController(music, animated: true)
        }
    }
}


