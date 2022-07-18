//
//  SecondToDoListViewController.swift
//  Money keeper
//
//  Created by Влад Бокин on 11.07.2022.
//

import UIKit
import RealmSwift

class SecondToDoListViewController: UIViewController {
 
    let myTasks = ToDoTask()
    
    let realm = try! Realm()
    
    @IBOutlet weak var TaskTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.TaskTableViewOutlet.delegate = self
        self.TaskTableViewOutlet.dataSource = self
        
        self.TaskTableViewOutlet.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
      
        
    }
    
    @IBAction func AddTaskButtonAction(_ sender: Any) {
        addTaskAlert(title: "Alert", message: "Write new task", style: .alert)
    }
    func reloadData() {
        
    }
    //MARK: - Alert
    func addTaskAlert(title: String, message: String, style: UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "OK", style: .default) { [self] (action) in
            let newTask = alertController.textFields?.first?.text
            
            myTasks.name = newTask ?? ""
            myTasks.isCompleted = false
            
            
            try! realm.write {
                realm.add(myTasks)
            }
            self.TaskTableViewOutlet.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { _ in }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
  
}


extension SecondToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      let tasks = realm.objects(ToDoTask.self)
      print(tasks)
      return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let tasks = realm.objects(ToDoTask.self)
        let task = tasks[indexPath.row]
        cell.setupCell(task: task)
        return cell
    }
    
    
}
