//
//  DraggableItem.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

enum Item: String {
    case pallette
    case ruler
    case dice
    case coin
    case lock
    case calculator
    case undefined
}

class DraggableItem: UIButton {
    @IBInspectable var rawItem: String = Item.undefined.rawValue {
        didSet {
            self.item = Item(rawValue: self.rawItem.lowercased()) ?? .undefined
        }
    }
    var item: Item = .undefined
    let defaults = UserDefaults.standard

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)

        if let first = touches.first {
            let pos = first.location(in: superview)
            let x = pos.x - self.frame.width / 2
            let y = pos.y - self.frame.height / 2
            let origin = CGPoint(x: x, y: y)
            self.frame = CGRect(origin: origin, size: self.frame.size)

//            let defaults = UserDefaults.standard
//            defaults.synchronize()
//            defaults.setValue([x, y], forKey: item.rawValue)
//            defaults.synchronize()
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if let first = touches.first {
            let pos = first.location(in: superview)
            let x = pos.x - self.frame.width / 2
            let y = pos.y - self.frame.height / 2
            defaults.setValue([x, y], forKey: item.rawValue)
        }
    }
}
