//
//  TextFields.swift
//  KmToMiles
//
//  Created by Danylo Kushlianskyi on 25.04.2022.
//

import UIKit

@IBDesignable
class TextFields: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
        
    }
    
    func customizeView(){
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1558668894)
        layer.cornerRadius = 5.0
        textAlignment = .center
        if let _ = placeholder{
            let place = NSMutableAttributedString(string: placeholder!, attributes: [.foregroundColor: UIColor.white])
                
            attributedPlaceholder = place
            textColor = UIColor.white
            
        }
    }

}
