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
        let goal = Goal()
        goal.goalCompletionValue = Int32(exactly : 12.0)
    }


    @IBAction func addAchieverBtnWerePressed(_ sender: Any) {
        print("button was pressed!")
    }
}

