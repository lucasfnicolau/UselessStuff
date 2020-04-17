//
//  DiceViewController.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var faces = [UIImage]()

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...6 {
            faces.append(UIImage(named: "\(i)") ?? UIImage())
        }
        imageView.animationImages = faces.shuffled()
        imageView.animationRepeatCount = -1
        imageView.animationDuration = 0.65
        imageView.startAnimating()
    }

    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
