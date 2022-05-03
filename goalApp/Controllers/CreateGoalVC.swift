//
//  CreateGoalVCViewController.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 03.05.2022.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var NextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func longTermPressed(_ sender: Any) {
    }
    @IBAction func shortTermPressed(_ sender: Any) {
    }
    @IBAction func OnNextPressed(_ sender: Any) {
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
//        dismissDetail()
        self.dismiss(animated: true, completion: nil)
    }


}
