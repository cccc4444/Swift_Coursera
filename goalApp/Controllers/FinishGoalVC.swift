//
//  FinishGoalVC.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 04.05.2022.
//

import UIKit

class FinishGoalVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var BackBtn: UIButton!
    @IBOutlet weak var PointsTextField: UITextField!
    @IBOutlet weak var CreateGoalBtn: UIButton!
    
    var goalDescription: String!
    var goalType: TypesOfGoal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateGoalBtn.bindKeyboard()
        PointsTextField.delegate = self
    }

    
    func initData(description: String, type: TypesOfGoal){
        self.goalDescription = description
        self.goalType = type
    }
    
    @IBAction func CreateGoalPressed(_ sender: Any) {
        // pass data to core data model
        
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
}
