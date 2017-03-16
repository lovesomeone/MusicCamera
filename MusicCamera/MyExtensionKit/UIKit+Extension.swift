//
//  UIKit+Extension.swift
//  Starter
//
//  Created by 程平 on 16/8/22.
//  Copyright © 2016年 程平. All rights reserved.
//

import Foundation
import UIKit

//实现在storyboard上的UITabbar Item的 selected image 有效果（ps：不需要在每个controller中再次代码实现）
extension UITabBarController{
    
    open override func viewDidLoad() {
        let items = self.tabBar.items
        guard items != nil else{return}
        print("extension ==>  tabItems \(items?.count)")
        for item in items!{
            if let selectedImage = item.selectedImage {
                print("UITabBarController slectedImage ===>\(selectedImage)")
                item.selectedImage = selectedImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            }
            
        }
    }
}



extension UINavigationController {
    
    open override func viewDidLoad() {
        if let selectedImage = self.tabBarItem.selectedImage {
            print("UINavigationController slectedImage ===>\(selectedImage)")
            self.tabBarItem.selectedImage = selectedImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        
       
    }
    
}
