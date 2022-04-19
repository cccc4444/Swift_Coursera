//
//  BorderButton.swift
//  app-swoosh
//
//  Created by Danylo Kushlianskyi on 17.04.2022.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
    }
}
