//
//  NZItemLabel.swift
//  NZTable
//
//  Created by Zhang ning on 5/17/16.
//  Copyright © 2016 Zhang ning. All rights reserved.
//

import Foundation
import UIKit


class NZBaseItemLabel: NZBaseItemView {
    var label = UILabel()
    
    required init(frame: CGRect, item: NZBaseLayoutItem) {
        super.init(frame: frame, item: item)
        label = UILabel.init(frame: frame)
        label.backgroundColor = UIColor.blackColor()
        self.addSubview(label)
        if item is NZLabelItem.Type {
            label.text = (item as! NZLabelItem).text
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}