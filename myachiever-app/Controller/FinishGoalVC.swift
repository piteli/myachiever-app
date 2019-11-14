//
//  FinishGoalVC.swift
//  myachiever-app
//
//  Created by Fitri San on 15/11/2019.
//  Copyright © 2019 Fitri San. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointTextField: UITextField!
    var goalDescription : String!
    var goalType : GoalType!
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
    }
    
    func initData(description: String, type : GoalType){
        self.goalDescription = description
        self.goalType = type
        pointTextField.delegate = self
    }
 

    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        //pass data into core data Goal Model
        
    }
}
