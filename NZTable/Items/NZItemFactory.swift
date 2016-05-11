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

struct NZItemFacotry {
    private var itemTables = [String: AnyClass]()
    private var createItemHooks = [String: [createItemViewHook]]()
    
    static let shareInstance = NZItemFacotry()
    
    func getViewTypeCount () {
        itemTables.count
    }
    
    func createItem(itemId id: String,  withItem item:NZBaseLayoutItem, frame:CGRect)-> NZBaseItemView? {
        /**
         if (!itemTables.keys.contains(id)) {
         return nil
         }
         let itemClass:AnyClass = itemTables[id]!
         if (itemClass is NSNull.Type) {
         return nil
         }
         if itemClass is NZBaseItemView.Type {
         let itemView = (itemClass as! NZBaseItemView.Type).init(frame: frame, item: item)
         return invokeCreateHooks(view: itemView, itemId: id)
         }
         return nil
         */
        guard itemTables.keys.contains(id),
              let itemClass: AnyObject = itemTables[id]
              where itemClass is NZBaseItemView.Type else{
              return nil
        }
        
        let itemView = (itemClass as! NZBaseItemView.Type).init(frame: frame, item: item)
        return invokeCreateHooks(view: itemView, itemId: id)
    }
    
    mutating func registCreateHook(createItemHook createViewHook:createItemViewHook, withItemView:String) {
        if createItemHooks.keys.contains(withItemView) {
            var hooks = createItemHooks[withItemView]!
            hooks += [createViewHook]
            createItemHooks.updateValue(hooks, forKey: withItemView)
        } else {
            createItemHooks[withItemView] = [createViewHook]
        }
    }
    
    private func invokeCreateHooks(view itemView: NZBaseItemView, itemId id: String) -> NZBaseItemView {
        if createItemHooks.keys.contains(id) {
           createItemHooks[id]?.enumerate().forEach({$1(itemView)})
        }
        
        return itemView
    }
}