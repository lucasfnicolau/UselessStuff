//
//  PalletteViewController.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 16/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit
import PencilKit

class PalletteViewController: UIViewController, PKCanvasViewDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    let canvasView = PKCanvasView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvasView)

        canvasView.delegate = self
        canvasView.backgroundColor = .white
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            canvasView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let window = view.window,
            let toolPicker = PKToolPicker.shared(for: window) else { return }
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }

    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        canvasView.drawing = PKDrawing()
        if let inkingTool = canvasView.tool as? PKInkingTool {
            canvasView.backgroundColor = inkingTool.color
        }
    }
}
