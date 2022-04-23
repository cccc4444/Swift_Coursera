//
//  ViewController.swift
//  window-shopper
//
//  Created by Danylo Kushlianskyi on 22.04.2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTextField!
    @IBOutlet weak var PriceTxt: CurrencyTextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBAction func ClearCalculatorPressed(_ sender: Any) {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTxt.text = ""
        PriceTxt.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        
        let calcButton = UIButton(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: 60))
        calcButton.backgroundColor = UIColor(red: 250, green: 0, blue: 0, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.setTitleColor(UIColor.white, for: .normal)
        calcButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcButton
        PriceTxt.inputAccessoryView = calcButton
        
    }
    
    @objc func calculate (){ // function uses Objective-c
       
        if let wageTxt = wageTxt.text, let priceTxt = PriceTxt.text{
            if let wage = Double(wageTxt), let price = Double(priceTxt){
                view.endEditing(true) // hide keyboaed
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
                resultLabel.text = "\(Wage.getHours(forWage: wage, forPrice: price))"
            }
        }
    }
    
    

}

