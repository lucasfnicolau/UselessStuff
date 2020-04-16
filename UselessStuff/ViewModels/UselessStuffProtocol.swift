//
//  UselessStuffProtocol.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import Foundation

protocol UselessStuffProtocol {
    var defaults: UserDefaults { get }
    func checkItemsPosition(_ items: [DraggableItem])
    func appHasBeenOpenedBefore() -> Bool
}
