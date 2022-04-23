//
//  CurrencyTextField.swift
//  window-shopper
//
//  Created by Danylo Kushlianskyi on 22.04.2022.
//

import UIKit

@IBDesignable // for recreating code in Interface builder
class CurrencyTextField: UITextField {
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
        
    }
    
    func customizeView(){
        
        backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        if let _ = placeholder{
            let place = NSAttributedString(string: placeholder!, attributes: [.foregroundColor: UIColor.white])
            
            attributedPlaceholder = place
            
            textColor = UIColor(white: 1.0, alpha: 1)
        
        }
    }
    

}
