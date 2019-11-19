//
//  ViewController.swift
//  myachiever-app
//
//  Created by Fitri San on 30/10/2019.
//  Copyright © 2019 Fitri San. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class AchieverVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var goals : [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects(){
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
    }
 

    @IBAction func addAchieverBtnWerePressed(_ sender: Any) {
        print("button was pressed!")
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
}

extension AchieverVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell()}
        let goal = goals[indexPath.row]
        cell.configureCell(goal : goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return [deleteAction]
    }
    
}

extension AchieverVC{
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        do{
            try managedContext.save()
            print("successfully removed goal!")
        }catch{
            debugPrint("Could not remove\(error.localizedDescription)")
        }
    }
    func fetch(completion: (_ complete: Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do{
            try managedContext.fetch(fetchRequest)
            print("successfully fetched data")
            completion(true)
        }catch{
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}

