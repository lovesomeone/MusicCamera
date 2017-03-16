//
//  Labels.swift
//  EvoRadio
//
//  Created by Jarvis on 11/26/16.
//  Copyright © 2016 JQTech. All rights reserved.
//

import UIKit

extension UILabel {
    func textSize() -> CGSize {
        var rect = CGRect.zero
        if let text = self.text{
            let textString = NSString(string:text )
            rect = textString.boundingRect(with: Device.size(), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: self.font], context: nil)
        }
      
        
        return rect.size
    }
}
