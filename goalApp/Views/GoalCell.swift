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
    
    func configureCell(description: String, type: TypesOfGoal, goalProgressAmount: Int){
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type.rawValue
        self.goalProgressLabel.text = String(goalProgressAmount)
    }
}
