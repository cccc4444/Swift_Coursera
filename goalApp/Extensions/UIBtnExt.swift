//
//  UIBtnExt.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 04.05.2022.
//

import UIKit

extension UIButton {
    
    func selectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.3215686275, blue: 0.8705882353, alpha: 1)
    }
    func deselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.3215686275, blue: 0.8705882353, alpha: 0.4459333609)
    }
}
