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

protocol NZBaseLayoutItem {
    var type: NZItemType { get }
    var x: CGFloat { get set }
    var y: CGFloat { get set }
    var height: CGFloat { get set }
    var width: CGFloat { get set }
    var imageURL: String { get set }
    var backgroundColor: String { get set }
    var frontendColor: String { get set }
    var contentId: Int { get set }
}

struct NZViewItem : NZBaseLayoutItem {
    var type: NZItemType = NZItemType.BaseView
    var x: CGFloat = 0
    var y: CGFloat = 0
    var height: CGFloat = UIScreen.mainScreen().bounds.height/4.0
    var width: CGFloat = UIScreen.mainScreen().bounds.width
    var imageURL: String = ""
    var backgroundColor: String = "FFFFFF"
    var frontendColor: String = "FFFFFF"
    var contentId: Int = 0
}

struct NZLabelItem: NZBaseLayoutItem {
    var type: NZItemType = NZItemType.Label
    var x: CGFloat
    var y: CGFloat
    var height: CGFloat
    var width: CGFloat
    var imageURL: String
    var backgroundColor: String
    var frontendColor: String
    var contentId: Int = 0
    var text: String = ""
    var attributeText: NSAttributedString? = NSAttributedString(string:"")
    var shadowColor: UIColor? = nil
}