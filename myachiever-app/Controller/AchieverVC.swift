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
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
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
    
}

extension AchieverVC{
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

