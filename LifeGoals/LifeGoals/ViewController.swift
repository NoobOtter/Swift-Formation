//
//  ViewController.swift
//  LifeGoals
//
//  Created by Marc Schneider on 13/08/2018.
//  Copyright © 2018 Hippo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    let _goalManager = GoalManager()
    @IBOutlet weak var ui_NewGoalTextField: UITextField!
    @IBOutlet weak var ui_goalsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ui_NewGoalTextField.delegate = self
        ui_goalsTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let goalText = ui_NewGoalTextField.text, let goalIndex = _goalManager.addGoal(withText: goalText) {
            ui_goalsTableView.insertRows(at: [IndexPath(row: goalIndex, section: 0)], with: .automatic)
            ui_NewGoalTextField.text = nil
        }
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = nil
        textField.resignFirstResponder()
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _goalManager.getGoalCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goal-cell", for: indexPath)
        cell.textLabel?.text = _goalManager.getGoal(atIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        _goalManager.removeGoal(atIndex: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }


}

