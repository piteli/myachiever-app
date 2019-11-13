//
//  ViewController.swift
//  myachiever-app
//
//  Created by Fitri San on 30/10/2019.
//  Copyright © 2019 Fitri San. All rights reserved.
//

import UIKit
import CoreData

class AchieverVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell()}
        cell.configureCell(description: "Eat salad twice a week", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
    
    
}

