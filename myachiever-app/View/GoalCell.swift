//
//  GoalCell.swift
//  myachiever-app
//
//  Created by Fitri San on 31/10/2019.
//  Copyright © 2019 Fitri San. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    
    @IBOutlet weak var goalDescLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    func configureCell(goal : Goal){
        self.goalDescLabel.text = goal.goalDesc
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(describing : goal.goalProgress)
    }
}
