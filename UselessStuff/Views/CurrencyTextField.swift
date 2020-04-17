//
//  CurrencyTextField.swift
//  CurrencyConverterMVVM
//
//  Created by Lucas Fernandez Nicolau on 07/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

enum CurrencyType {
    case dollar
    case euro
    case sterling
    case yen
    case rupee
    case austral
    case franc
    case turkishlira
    case bitcoin
}

@IBDesignable
class CurrencyTextField: DarkRoundedTextField {

    private var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    private var currencyType: CurrencyType = .dollar
    private var currencyTypeImageView: UIImageView?

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setLayout() {
        currencyTypeImageView = UIImageView(image: symbol(for: .dollar))
        guard let imageView = currencyTypeImageView else { return }
        imageView.tintColor = .white
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.8),
            imageView.widthAnchor.constraint(equalToConstant: self.frame.height * 0.8)
        ])
        super.setLayout()
        self.attributedPlaceholder = nil
    }

    func setTo(currencyType: CurrencyType) {
        currencyTypeImageView?.image = symbol(for: currencyType)
    }

    private func symbol(for currencyType: CurrencyType) -> UIImage {
        let image: UIImage?

        switch currencyType {
        case .dollar:
            image = UIImage(systemName: "dollarsign.square.fill")
        case .euro:
            image = UIImage(systemName: "eurosign.square.fill")
        case .sterling:
            image = UIImage(systemName: "sterlingsign.square.fill")
        case .yen:
            image = UIImage(systemName: "yensign.square.fill")
        case .rupee:
            image = UIImage(systemName: "rupeesign.square.fill")
        case .austral:
            image = UIImage(systemName: "australsign.square.fill")
        case .franc:
            image = UIImage(systemName: "francsign.square.fill")
        case .bitcoin:
            image = UIImage(systemName: "bitcoinsign.square.fill")
        case .turkishlira:
            image = UIImage(systemName: "turkishlirasign.square.fill")
        }

        return (image ?? UIImage()).withRenderingMode(.alwaysTemplate)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        padding.left = self.frame.height * 0.8 + 10
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        padding.left = self.frame.height * 0.8 + 10
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        padding.left = self.frame.height * 0.8 + 10
        return bounds.inset(by: padding)
    }
}
