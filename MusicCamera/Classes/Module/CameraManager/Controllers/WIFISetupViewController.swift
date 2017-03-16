//
//  WIFISetupViewController.swift
//  MusicCamera
//
//  Created by 程平 on 17/2/26.
//  Copyright © 2017年 程平. All rights reserved.
//

import UIKit

class WIFISetupViewController: UIViewController {

    @IBOutlet weak var currentWifiContainerView: UIView!
    
    @IBOutlet weak var currentWifiNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    fileprivate var wifiNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "wifiCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        wifiNames = ["123","fkasjfhff","rtrtyryry"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}


extension WIFISetupViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wifiNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wifiCell", for: indexPath)
        
        cell.textLabel?.text = wifiNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "其它网络"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}

extension WIFISetupViewController: UITableViewDelegate{
    
}
