//
//  CurrencyTableViewCell.swift
//  UselessStuff
//
//  Created by Lucas Fernandez Nicolau on 17/04/20.
//  Copyright © 2020 Lucas Fernandez Nicolau. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet weak var currencyTextField: CurrencyTextField!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(for currencyType: CurrencyType) {
        self.currencyTextField.setTo(currencyType: currencyType)
        self.currencyTextField.text = "0.00"
    }
}
