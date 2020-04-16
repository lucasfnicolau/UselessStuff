//
//  MainScreenViewController.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet var itemButtons: [DraggableItem]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func itemTouched(_ draggableItem: DraggableItem) {
        guard draggableItem.item != .undefined else { return }
        let segueIdentifier = draggableItem.item.rawValue
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}

