//
//  MainScreenViewController.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet var draggableItems: [DraggableItem]!
    let uselessStuffDelegate = UselessStuffDelegate()
    var shouldMoveItems = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !uselessStuffDelegate.appHasBeenOpenedBefore() {
            present(uselessStuffDelegate.getAlertController(), animated: true, completion: nil)
        } else if shouldMoveItems {
            uselessStuffDelegate.checkItemsPosition(draggableItems)
            shouldMoveItems = false
        }
    }

    @IBAction func itemTouched(_ draggableItem: DraggableItem) {
        guard draggableItem.item != .undefined else { return }
        let segueIdentifier = draggableItem.item.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}

