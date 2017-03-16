//
//  CameraListViewController.swift
//  MusicCamera
//
//  Created by 程平 on 17/2/25.
//  Copyright © 2017年 程平. All rights reserved.
//

import UIKit
import EmptyKit


class CameraListViewController: UITableViewController {

    
    
    
    
    var allDatasource: [String] = ["123","345","567"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.edgesForExtendedLayout = .top
// self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0).
       // self.edgesForExtendedLayout = []
       /// self.automaticallyAdjustsScrollViewInsets = false
        
        tableView.tableFooterView = UIView()
        let nib = UINib(nibName: "DeviceTableViewCell", bundle: nil) //nibName指的是我们创建的Cell文件名
        self.tableView.register(nib, forCellReuseIdentifier: "deviceCell")
        
        setupEmpty()
        
        // 定义所有子页面返回按钮的名称
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)

        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allDatasource.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath)  as! DeviceTableViewCell
         cell.delegate = self
               return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
   
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        print("section = \(section)")
        if section == 0 {
            return 10
        }else{
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         return 5
    }
    
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "seletedDevice", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "seletedDevice"){
            let destinationC = segue.destination as! CameraSeletedViewController
            destinationC.deviceTitle = allDatasource[(tableView.indexPathForSelectedRow?.section)!]
            
        }
    }
    
    
    
    @IBAction func addDevice(_ sender: UIBarButtonItem) {
        
        let addController = AddCameraViewController.swift_loadFromStoryboard("AddCamera", storyboardId: "AddCameraViewController")
        
        self.navigationController?.pushViewController(addController, animated: true)
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

extension CameraListViewController: DeviceTableViewCellDelegate{
    func buttonTouched(cell: DeviceTableViewCell, buttonTag: Int) {
         print("buttonTag==>\(buttonTag)")
        if buttonTag == 4 {
            self.performSegue(withIdentifier: "showSetup", sender: nil)
        }else if buttonTag == 3 {
            
        }else if buttonTag == 2 {
            print("clock")
            let clockController = DCHomeViewController.swift_loadFromStoryboard("ClockRefe", storyboardId: "DCHomeViewController")
            self.navigationController?.pushViewController(clockController, animated: true)
        }
    }
}


// MARK: - Setup
extension CameraListViewController {
    
    func setupEmpty() {
        tableView.ept.dataSource = self
        tableView.ept.delegate = self
    }
    
}
// MARK: - Setup EmptyDataSource

extension CameraListViewController: EmptyDataSource {
    
    func imageForEmpty(in view: UIView) -> UIImage? {
        return UIImage(named: "emptyData")
    }
    
    func titleForEmpty(in view: UIView) -> NSAttributedString? {
        let title = "你还没有添加设置，快来添加吧"
        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [String : Any] = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: font]
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString? {
        let title = "添加我的设备"
        let font = UIFont.systemFont(ofSize: 17)
        let attributes: [String : Any] = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: font]
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.brown
    }
    
    func customViewForEmpty(in view: UIView) -> UIView? {

        return nil
    }
    
    
}
// MARK: - Setup EmptyDelegate
extension CameraListViewController: EmptyDelegate {
    
    func emptyButton(_ button: UIButton, tappedIn view: UIView) {
        print( #function, #line, type(of: self))
        print("emptyButton")
    }
    
    func emptyView(_ emptyView: UIView, tappedIn view: UIView) {
        print( #function, #line, type(of: self))
         print("emptyView")
    }
}
