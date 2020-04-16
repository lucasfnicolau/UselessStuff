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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkItemsPosition()
    }

    func checkItemsPosition() {
        let defaults = UserDefaults.standard

        for draggableItem in draggableItems {
            if let positionArray = defaults.array(forKey: draggableItem.item.rawValue) {
                if let pos = positionArray as? [CGFloat] {
                    let origin = CGPoint(x: pos[0], y: pos[1])
                    draggableItem.frame = CGRect(origin: origin, size: draggableItem.frame.size)
                }
            }
        }
    }

    @IBAction func itemTouched(_ draggableItem: DraggableItem) {
        guard draggableItem.item != .undefined else { return }
        let segueIdentifier = draggableItem.item.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}

