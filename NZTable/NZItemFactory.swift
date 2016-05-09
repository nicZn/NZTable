//
//  ItemFactory.swift
//  NZTable
//
//  Created by Zhang ning on 5/9/16.
//  Copyright © 2016 Zhang ning. All rights reserved.
//

import Foundation
import UIKit

typealias createItemViewHook = (NZBaseItemView) -> ()


class NZItemFacotry: NSObject {
    private var itemTables: [String: AnyClass]
    private var createItemHooks: [String: [createItemViewHook]]
    
    static let shareInstance = NZItemFacotry()
    
    override private init () {
        itemTables = Dictionary()
        createItemHooks = Dictionary()
    }
    
    func getViewTypeCount () {
        itemTables.count
    }
    
    func createItem(itemId id: String,  withItem item:NZBaseLayoutItem, frame:CGRect)-> NZBaseItemView? {
        if (!itemTables.keys.contains(id)) {
            return nil
        }
        let itemClass:AnyClass = itemTables[id]!
        if (itemClass is NSNull.Type) {
            return nil
        }
        if itemClass is NZBaseItemView.Type {
            let itemView = (itemClass as! NZBaseItemView.Type).init()
            itemView.item = item
            invokeCreateHooks(view: itemView, itemId: id)
            itemView
        }
        return nil
    }
    
    func registCreateHook(createItemHook createViewHook:createItemViewHook, withItemView:String) {
        if createItemHooks.keys.contains(withItemView) {
            var hooks:Array = createItemHooks[withItemView]!
            hooks += [createViewHook]
            createItemHooks.updateValue(hooks, forKey: withItemView)
        } else {
            createItemHooks[withItemView] = [createViewHook]
        }
    }
    
    func invokeCreateHooks(view itemView: NZBaseItemView, itemId id: String) {
        if  !createItemHooks.keys.contains(id) {
            return
        }
        
        createItemHooks[id]?.enumerate().forEach({$1(itemView)})
    }
}