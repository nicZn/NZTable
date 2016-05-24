//
//  NZModule.swift
//  NZTable
//
//  Created by Zhang ning on 5/11/16.
//  Copyright © 2016 Zhang ning. All rights reserved.
//

import Foundation
import UIKit

protocol BaseModuleProtocol {
    func getViewController(key: String) -> UIViewController
}


struct NZBaseModule: BaseModuleProtocol {
    var viewControllers = [String: UIViewController]()
    var storyboards = []
    
    func getViewController(key: String) -> UIViewController {
        let viewController = self.viewControllers[key]
        return viewController! as UIViewController
    }
}