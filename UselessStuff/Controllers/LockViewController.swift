//
//  LockViewController.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class LockViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passTextField: UITextField!

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func keyboardButtonTouched(_ sender: KeyboardButton) {
        if passTextField.text != nil {
            passTextField.text! += "•"
        } else {
            passTextField.text = "•"
        }
    }

    @IBAction func clearButtonTouched(_ sender: UIButton) {
        self.passTextField.text = ""
    }
}
