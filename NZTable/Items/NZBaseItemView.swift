//
//  NZBaseItemView.swift
//  NZTable
//
//  Created by Zhang ning on 5/9/16.
//  Copyright © 2016 Zhang ning. All rights reserved.
//

import Foundation
import UIKit

class NZBaseItemView: UIView {
    var layoutItem: NZBaseLayoutItem?
    
    required init(frame: CGRect, item: NZBaseLayoutItem) {
        super.init(frame: frame)
        self.layoutItem = item
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}