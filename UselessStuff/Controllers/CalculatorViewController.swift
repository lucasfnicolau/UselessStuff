//
//  CalculatorViewController.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var calculatorTextField: UITextField!

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func calculatorButtonTouched(_ button: UIButton) {
        if calculatorTextField.text == nil || calculatorTextField.text == "0" {
            calculatorTextField.text = button.titleLabel?.text
        } else {
            if button.titleLabel?.text != "." || !calculatorTextField.text!.contains(".") {
                calculatorTextField.text! += button.titleLabel?.text ?? ""
            }
        }
    }

    @IBAction func equalButtonTouched(_ sender: UIButton) {
        calculatorTextField.text = "eureka!"
    }

    @IBAction func clearButtonTouched(_ sender: UIButton) {
        calculatorTextField.text = "0"
    }
}
