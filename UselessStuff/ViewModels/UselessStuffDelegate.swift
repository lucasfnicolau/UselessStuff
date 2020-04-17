//
//  UselessStuffDelegate.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class UselessStuffDelegate: NSObject, UselessStuffProtocol {
    var defaults: UserDefaults

    override init() {
        self.defaults = UserDefaults.standard
        super.init()
    }
    
    func checkItemsPosition(_ items: [DraggableItem]) {
        for draggableItem in items {
            if let positionArray = defaults.array(forKey: draggableItem.item.rawValue) {
                if let pos = positionArray as? [CGFloat] {
                    let origin = CGPoint(x: pos[0], y: pos[1])
                    draggableItem.frame = CGRect(origin: origin, size: draggableItem.frame.size)
                }
            }
        }
    }

    func appHasBeenOpenedBefore() -> Bool {
        if !defaults.bool(forKey: "appHasBeenOpenedBefore") {
            defaults.set(true, forKey: "appHasBeenOpenedBefore")
            return false
        }
        return true
    }

    func getAlertController() -> UIAlertController {
        let alert = UIAlertController(title: "Organize the shelf!", message: "Drag and drop the items wherever you like. After doing that, touch on the items to use them.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        return alert
    }
}
