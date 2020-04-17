//
//  RulerViewController.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class RulerViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
