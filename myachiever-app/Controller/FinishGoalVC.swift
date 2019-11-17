//
//  FinishGoalVC.swift
//  myachiever-app
//
//  Created by Fitri San on 15/11/2019.
//  Copyright © 2019 Fitri San. All rights reserved.
//

import UIKit
import CoreData

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
        if pointTextField.text != ""{
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion:nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion : (_ finished : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDesc = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletion = Int32(pointTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            print("Successfully saved!")
            completion(true)
        }catch{
            debugPrint("Could not Save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
