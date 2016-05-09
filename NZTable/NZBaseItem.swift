//
//  NZBaseItem.swift
//  NZTable
//
//  Created by Zhang ning on 5/9/16.
//  Copyright © 2016 Zhang ning. All rights reserved.
//

import Foundation
import UIKit

enum NZItemType {
    case BaseView
    case Label
    case Image
    case Button
    case Switch
    case TextField
}

class NZBaseLayoutItem: NSObject {
    var type: NZItemType = NZItemType.BaseView
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var height: CGFloat = 0.0
    var width: CGFloat = 0.0
    var imageURl: String = ""
    var backgroundColor: String = "FFFFFF"
    var frontendColor: String = "FFFFFF"
    var contentId: Int = -1
}

class NSViewItem: NZBaseLayoutItem {
}

class NZLabelItem: NZBaseLayoutItem {
    var text: String = ""
    var attributeText: NSAttributedString? = NSAttributedString(string:"")
    var shadowColor: UIColor? = nil
}