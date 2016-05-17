//
//  NZColorManager.swift
//  NZTable
//
//  Created by Zhang ning on 5/17/16.
//  Copyright © 2016 Zhang ning. All rights reserved.
//

import Foundation
import UIKit

struct NZColorManager {
    func colorFromString(color: String) -> UIColor {
        var cString:String = color.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if color.characters.count < 6 || color.characters.count > 8  {
            return UIColor.blackColor()
        }
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        } else if(cString.hasPrefix("0x")) {
            cString = (cString as NSString).substringFromIndex(2)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.blackColor()
        }
        
        var rgb : UInt64 = 0;
        NSScanner(string: cString).scanHexLongLong(&rgb)
        
        return UIColor(red: (CGFloat)((rgb & 0xFF0000) >> 16)/255.0,
                       green: (CGFloat)((rgb & 0xFF0000) >> 8)/255.0,
                       blue: (CGFloat)(rgb & 0xFF)/255.0,
                       alpha: CGFloat(1))
    }
}