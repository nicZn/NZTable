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
    static var type: NZItemType { get set }
    static var x: CGFloat { get set }
    static var y: CGFloat { get set }
    static var height: CGFloat { get set }
    static var width: CGFloat { get set }
    static var imageURL: String { get set }
    static var backgroundColor: String { get set }
    static var frontendColor: String { get set }
    static var contentId: Int { get set }
}

struct NSViewItem : NZBaseLayoutItem {
    static var type: NZItemType = NZItemType.Label
    static var x: CGFloat = 0
    static var y: CGFloat = 0
    static var height: CGFloat = 0
    static var width: CGFloat = 0
    static var imageURL: String = ""
    static var backgroundColor: String = "FFFFFF"
    static var frontendColor: String = "000000"
    static var contentId: Int = 0
}

struct NZLabelItem: NZBaseLayoutItem {
    static var type: NZItemType = NZItemType.Label
    static var x: CGFloat = 0
    static var y: CGFloat = 0
    static var height: CGFloat = 0
    static var width: CGFloat = 0
    static var imageURL: String = ""
    static var backgroundColor: String = "FFFFFF"
    static var frontendColor: String = "000000"
    static var contentId: Int = 0
    var text: String = ""
    var attributeText: NSAttributedString? = NSAttributedString(string:"")
    var shadowColor: UIColor? = nil
}