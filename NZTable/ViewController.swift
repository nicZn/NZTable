//
//  ViewController.swift
//  NZTable
//
//  Created by Zhang ning on 5/9/16.
//  Copyright © 2016 Zhang ning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var factory = NZItemFactory.shareInstance
        factory.regist(NZBaseItemView.self, key: "base")
        let item = NZViewItem()
        let view = factory.createItem(itemId: "base", withItem: item, frame: CGRectMake(0, 0, 12, 12))
        view!.backgroundColor = UIColor.blueColor()
        self.view.addSubview(view!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

