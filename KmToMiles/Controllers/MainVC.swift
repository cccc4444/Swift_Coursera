//
//  ViewController.swift
//  KmToMiles
//
//  Created by Danylo Kushlianskyi on 25.04.2022.
//

import UIKit

class MainVC: UIViewController {
    var isFromKmtoMiles: Bool = true
    
    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var invertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var kmText: TextFields!

    @IBAction func invertSystems(_ sender: Any) {
        isFromKmtoMiles = !isFromKmtoMiles
        if isFromKmtoMiles{
            kmText.placeholder = "Kilometers"
        }
        else{
            kmText.placeholder = "Miles"
        }
    }
    
    @IBAction func resetCalculations(_ sender: Any) {
        resultLabel.isHidden = true
        additionalLabel.isHidden = true
        invertButton.isHidden = true
        kmText.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.isHidden = true
        additionalLabel.isHidden = true
        invertButton.isHidden = true
        
        let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        
        calcButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        calcButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        kmText.inputAccessoryView = calcButton
        
        
        
    }
    
    @objc func calculate(){
        
        if let text = kmText.text{
            if let _ = Double(text){
                view.endEditing(true)
                resultLabel.isHidden = false
                additionalLabel.isHidden = false
                invertButton.isHidden = false
                switch isFromKmtoMiles {
                case true:
                    resultLabel.text = "\(Calculation.calculationsToMiles(kms: Double(text) ?? 0))"
                    additionalLabel.text = "Miles"
                case false:
                    resultLabel.text = "\(Calculation.calculationsToKms(mls: Double(text) ?? 0))"
                    additionalLabel.text = "Kilometers"
                }
                
            }
        }
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 179.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }


}

