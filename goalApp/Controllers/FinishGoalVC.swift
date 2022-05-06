//
//  FinishGoalVC.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 04.05.2022.
//

import UIKit
import CoreData
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
        if PointsTextField.text != ""{
            self.save(completion: {(complete) in
                if complete {
//                    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                    if let first = presentingViewController,
                          let second = first.presentingViewController{
                            first.view.isHidden = true
                            second.dismiss(animated: true)
                        second.viewWillAppear(true)

                       }
                }
            })
        }
        
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func save(completion:(_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(PointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            print("Success")
            completion(true)
        }
        catch{
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
    }

    
}
