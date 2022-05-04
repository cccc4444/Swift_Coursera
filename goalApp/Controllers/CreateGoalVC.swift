//
//  CreateGoalVCViewController.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 03.05.2022.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var NextBtn: UIButton!

    
    var goalType: TypesOfGoal = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextBtn.bindKeyboard()
        shortTermBtn.selectedColor()
        longTermBtn.deselectedColor()
        goalTxtView.delegate = self
        
    }
    
    @IBAction func longTermPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.selectedColor()
        shortTermBtn.deselectedColor()
    }
    @IBAction func shortTermPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.selectedColor()
        longTermBtn.deselectedColor()
    }
    @IBAction func OnNextPressed(_ sender: Any) {
        if goalTxtView.text != "What is your goal?" && goalTxtView.text != "" && goalTxtView.text != " " {
            guard let finishVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {
                return
            }
            finishVC.initData(description: goalTxtView.text, type: goalType)
            
    //      presentDetail(createGoalsVC)
            finishVC.modalPresentationStyle = .custom
            finishVC.transitioningDelegate = self
            self.present(finishVC, animated: true, completion: nil)
            
        }
        else {
            print("Suka")
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
//        dismissDetail()
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxtView.text = ""
        goalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    


}


//for transition
extension CreateGoalVC: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
    
}
