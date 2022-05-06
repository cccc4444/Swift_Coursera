//
//  GoalCellTableViewCell.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 03.05.2022.
//

import UIKit

class GoalCell: UITableViewCell {

    
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(goal: Goal){
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue{
            completionView.isHidden = false
        }
        else{
            completionView.isHidden = true
        }
    }
}
